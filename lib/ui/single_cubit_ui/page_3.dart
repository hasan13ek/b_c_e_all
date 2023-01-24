import 'package:b_c_e_all/data/repositories/card_repository.dart';
import 'package:b_c_e_all/single_cubit/single_state.dart';
import 'package:b_c_e_all/single_cubit/yagona_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersCardsPage2 extends StatelessWidget {
  const UsersCardsPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xff21064E),
            const Color(0xff6008F0).withOpacity(0.19),
          ],
        ),
      ),
      child: BlocProvider(
        create: (context) =>
            SingleCubit(myRepository: context.read<MyRepository>()),
        child: BlocBuilder<SingleCubit, CardSingleState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                centerTitle: true,
                title: const Text(
                  'Users Cards',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              body: state is LoadInProgress
                  ? const Center(child: CircularProgressIndicator())
                  : state is LoadInSuccess
                      ? Center(
                          child: Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemCount: state.cards.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: const EdgeInsets.only(
                                    top: 15,
                                    bottom: 15,
                                    left: 20,
                                    right: 20,
                                  ),
                                  padding: const EdgeInsets.all(20),
                                  height: 200,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Color(
                                            hexColor(state
                                                .cards[index].colors!.colorA
                                                .toString()),
                                          ),
                                          Color(
                                            hexColor(state
                                                .cards[index].colors!.colorB
                                                .toString()),
                                          ),
                                        ]),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            state.cards[index].cardType
                                                .toString(),
                                            style: const TextStyle(
                                              fontSize: 22,
                                              color: Colors.white,
                                            ),
                                          ),
                                          const Spacer(),
                                          SizedBox(
                                            width: 60,
                                            height: 40,
                                            child: Image.network(
                                              state.cards[index].iconImage
                                                  .toString(),
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 16),
                                      Text(
                                        state.cards[index].bankName.toString(),
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      Row(
                                        children: [
                                          Text(
                                            '${state.cards[index].moneyAmount}',
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          const Text(
                                            "SO'M",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 18),
                                      Text(
                                        state.cards[index].cardNumber
                                            .toString(),
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      : state is LoadInFailure
                          ? Text(
                              state.error.toString(),
                              style: const TextStyle(color: Colors.red, fontSize: 30),
                            )
                          : const SizedBox(),
            );
          },
        ),
      ),
    );
  }

  hexColor(String colorhexcode) {
    String colornew = '0xff$colorhexcode';
    colornew = colornew.replaceAll("#", "");
    int colorint = int.parse(colornew);
    return colorint;
  }
}
