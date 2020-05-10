import 'package:flutter/material.dart';
import 'api_service.dart';
import 'profile.dart';
import 'form_add_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BuildContext context;
  ApiService apiService;

  @override
  void initState() {
    super.initState();
    apiService = ApiService();
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return SafeArea(
      child: FutureBuilder(
        future: apiService.getProfiles(),
        builder: (BuildContext context, AsyncSnapshot<List<Profile>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  "Something wrong with message: ${snapshot.error.toString()}"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<Profile> profiles = snapshot.data;
            return _buildListView(profiles);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget _buildListView(List<Profile> profiles) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          Profile profile = profiles[index];
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                        Icon(Icons.account_circle, size: 100,),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                profile.name,
                                style: Theme.of(context).textTheme.title,
                              ),
                              Text(profile.email),
                              Text(profile.age.toString()),
                            ],
                          )
                        ],
                      ),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          FlatButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("PERHATIAN!!!"),
                                      content: Text(
                                          "Yakin untuk menghapus data ${profile.name}?"),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text("Ya"),
                                          onPressed: () {
                                            Navigator.pop(context);
                                            apiService
                                                .deleteProfile(profile.id)
                                                .then((isSuccess) {
                                              if (isSuccess) {
                                                setState(() {});
                                                Scaffold.of(this.context)
                                                    .showSnackBar(SnackBar(
                                                    content: Text(
                                                        "Hapus data berhasil")));
                                              } else {
                                                Scaffold.of(this.context)
                                                    .showSnackBar(SnackBar(
                                                    content: Text(
                                                        "Hapus data gagal")));
                                              }
                                            });
                                          },
                                        ),
                                        FlatButton(
                                          child: Text("Tidak"),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        )
                                      ],
                                    );
                                  });
                            },
                            child: Icon(Icons.delete),
                          ),
                          FlatButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                    return FormAddScreen(profile: profile);
                                  }));
                            },
                            child: Icon(Icons.edit),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
          );
        },
        itemCount: profiles.length,
      ),
    );
  }
}