import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../session/user_session.dart';
import '../car_form/form_vu.dart';
import 'dashboard_provider.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashBoard>(builder: (context, provider, child) {
      return WillPopScope(
        onWillPop: () => provider.onBackPressed(context),
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Center(child: Text('Cars DashBoard')),
            actions: [
              TextButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    await UserSession().deleteSession();
                  },
                  child: const Text(
                    'Close Session',
                    style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline),
                  ))
            ],
          ),
          body: SafeArea(
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 45, 10, 0),
                  child: Column(
                    children: [
                      Container(
                        height: 48,
                        decoration: BoxDecoration(
                            color: const Color(0xffB2DFDB),
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(8)),
                        child: const Center(
                          child: Text(
                            'Cars Model Listed From Dummy Json',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      Expanded(
                        child: ListView.separated(
                          itemCount: provider.cars.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                  'Category: ${provider.cars[index].category!}'),
                              subtitle:
                                  Text('Color: ${provider.cars[index].color!}'),
                              trailing: SizedBox(
                                  height: 55,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          'Model: ${provider.cars[index].model}'),
                                      const SizedBox(height: 8),
                                      SizedBox(
                                        width: 85,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              CreateCarScreen(
                                                                  provider.cars[
                                                                      index]))).then(
                                                      (value) {
                                                    if (value != null) {
                                                      provider.cars[index] =
                                                          value;
                                                      provider
                                                          .notifyListeners();
                                                    }
                                                  });
                                                },
                                                child: const Icon(Icons.edit,
                                                    color: Colors.blue)),
                                            const SizedBox(width: 12),
                                            GestureDetector(
                                              onTap: () {
                                                provider.cars.remove(
                                                    provider.cars[index]);
                                                provider.notifyListeners();
                                              },
                                              child: const Icon(Icons.delete,
                                                  color: Colors.red),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                              onTap: () {},
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: const BorderSide(color: Colors.grey),
                              ),
                              tileColor: Colors.white,
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              height: 12,
                            );
                          },
                        ),
                      ),
                    ],
                  ))),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreateCarScreen(null)))
                  .then((value) {
                if (value != null) {
                  provider.cars.add(value);
                  provider.notifyListeners();
                }
              });
            },
            child: const Icon(Icons.add),
          ),
        ),
      );
    });
  }
}
