import {
    StyleSheet,
    Text,
    View,
    Pressable,
    onPress,
    Image,
    useWindowDimensions,
    ScrollView,
    TouchableOpacity,
    TextInput,
  } from 'react-native';
  import React, {useState, useRef} from 'react';
  
  import menu_btn from '../../../assets/images/HeaderMenuBtn.png';
  import home_btn from '../../../assets/images/HeaderHomeBtn.png';
  import Logo from '../../../assets/images/Logo3.png';
  import backBtn from '../../../assets/images/backBtn.png';
  import wineBtlePic from '../../../assets/images/WineBottles/WineBottlePic9.png';
  
  import star_corner from '../../../assets/images/star_corner.png';
  import star_filled from '../../../assets/images/star_filled.png';
  import { Controller } from 'react-hook-form';
  // import { Item } from 'react-native-paper/lib/typescript/components/List/List';
  
  const WineReview = () => {
    const [defaultRating, setdefaultRating] = useState(0);
    const [maxRating, setmaxRating] = useState([1, 2, 3, 4, 5]);
  
    const [fruitsforwardRating, setfruitsforwardRating] = useState(0);
    const [maxfruitsforwardsRating, setmaxfruitsforwardRating] = useState([1, 2, 3, 4, 5]);

    const [berrysRating, setberrysRating] = useState(0);
    const [maxberrysRating, setmaxberrysRating] = useState([1, 2, 3, 4, 5]);

    const [fullbodiedRating, setfullbodiedRating] = useState(0);
    const [maxfullbodiedRating, setmaxfullbodiedRating] = useState([1, 2, 3, 4, 5]);

    const [thinRating, setthinRating] = useState(0);
    const [maxthinRating, setmaxthinRating] = useState([1, 2, 3, 4, 5]);

    const [longfinishRating, setlongfinishRating] = useState(0);
    const [maxlongfinishRating, setmaxlongfinishRating] = useState([1, 2, 3, 4, 5]);

    const [balanceRating, setbalanceRating] = useState(0);
    const [maxbalanceRating, setmaxbalanceRating] = useState([1, 2, 3, 4, 5]);

    const [complexRating, setcomplexRating] = useState(0);
    const [maxcomplexRating, setmaxcomplexRating] = useState([1, 2, 3, 4, 5]);

    const [elegantRating, setelegantRating] = useState(0);
    const [maxelegantRating, setmaxelegantRating] = useState([1, 2, 3, 4, 5]);

    const [chewyRating, setchewyRating] = useState(0);
    const [maxchewyRating, setmaxchewyRating] = useState([1, 2, 3, 4, 5]);

    const [softRating, setsoftRating] = useState(0);
    const [maxsoftRating, setmaxsoftRating] = useState([1, 2, 3, 4, 5]);

    const [silkyRating, setsilkyRating] = useState(0);
    const [maxsilkyRating, setmaxsilkyRating] = useState([1, 2, 3, 4, 5]);

    const [burnRating, setburnRating] = useState(0);
    const [maxburnRating, setmaxburnRating] = useState([1, 2, 3, 4, 5]);

    const [jammyRating, setjammyRating] = useState(0);
    const [maxjammyRating, setmaxjammyRating] = useState([1, 2, 3, 4, 5]);

    const [bellpepperRating, setbellpepperRating] = useState(0);
    const [maxbellpepperRating, setmaxbellpepperRating] = useState([1, 2, 3, 4, 5]);

    const [spicyRating, setspicyRating] = useState(0);
    const [maxspicyRating, setmaxspicyRating] = useState([1, 2, 3, 4, 5]);

    const [toastyRating, settoastyRating] = useState(0);
    const [maxtoastyRating, setmaxtoastyRating] = useState([1, 2, 3, 4, 5]);

    const [oakRating, setoakRating] = useState(0);
    const [maxoakRating, setmaxoakRating] = useState([1, 2, 3, 4, 5]);

    const [vegetableRating, setvegetableRating] = useState(0);
    const [maxvegetableRating, setmaxvegetableRating] = useState([1, 2, 3, 4, 5]);

    const [mineralityRating, setmineralityRating] = useState(0);
    const [maxmineralityRating, setmaxmineralityRating] = useState([1, 2, 3, 4, 5]);

    const [rubberRating, setrubberRating] = useState(0);
    const [maxrubberRating, setmaxrubberRating] = useState([1, 2, 3, 4, 5]);

    const [smokyRating, setsmokyRating] = useState(0);
    const [maxsmokyRating, setmaxsmokyRating] = useState([1, 2, 3, 4, 5]);

    const [ageofwineRating, setageofwineRating] = useState(0);
    const [maxageofwineRating, setmaxageofwineRating] = useState([1, 2, 3, 4, 5]);
  
    const startImgFilled = 'https://raw.githubusercontent.com/tranhonghan/images/main/star_filled.png';
    const starImgCorner = 'https://raw.githubusercontent.com/tranhonghan/images/main/star_corner.png';
  
    const CustomRatingBar = () => {
      return (
        <View style={styles.customRatingBarStyle}>
          {maxRating.map((item, key) => {
            return (
              <TouchableOpacity
                activeOpacity={0.7}
                key={item}
                onPress={() => setdefaultRating(item)}>
                  <Pressable
                  onPress={() => alert(defaultRating)}>
                <Image
                  style={styles.starImgStyle}
                  source={
                    item <= defaultRating
                      ? {uri: startImgFilled}
                      : {uri: starImgCorner}
                  }
                /></Pressable>
              </TouchableOpacity>
            );
          })}
        </View>
      );
    };
  
    const FruitForwardRatingFonc = () => {
      return (
        <View style={styles.customRatingBarStyle}>
          {maxRating.map((item, key) => {
            return (
              <TouchableOpacity
                activeOpacity={0.7}
                key={item}
                onPress={() => setfruitsforwardRating(item)}>
                <Image
                  style={styles.starImgStyle}
                  source={
                    item <= fruitsforwardRating
                      ? {uri: startImgFilled}
                      : {uri: starImgCorner}
                  }/>
              </TouchableOpacity>
            );
          })}
        </View>
      );
    };
  
    const BerrysRatingFonc = () => {
      return (
        <View style={styles.customRatingBarStyle}>
          {maxRating.map((item, key) => {
            return (
              <TouchableOpacity
                activeOpacity={0.7}
                key={item}
                onPress={() => setberrysRating(item)}>
                <Image
                  style={styles.starImgStyle}
                  source={
                    item <= berrysRating
                      ? {uri: startImgFilled}
                      : {uri: starImgCorner}
                  }
                />
              </TouchableOpacity>
            );
          })}
        </View>
      );
    };

    const FullBodiedRatingFonc = () => {
        return (
          <View style={styles.customRatingBarStyle}>
            {maxRating.map((item, key) => {
              return (
                <TouchableOpacity
                  activeOpacity={0.7}
                  key={item}
                  onPress={() => setfullbodiedRating(item)}>
                  <Image
                    style={styles.starImgStyle}
                    source={
                      item <= fullbodiedRating
                        ? {uri: startImgFilled}
                        : {uri: starImgCorner}
                    }
                  />
                </TouchableOpacity>
              );
            })}
          </View>
        );
      };

      const ThinRatingFonc = () => {
        return (
          <View style={styles.customRatingBarStyle}>
            {maxRating.map((item, key) => {
              return (
                <TouchableOpacity
                  activeOpacity={0.7}
                  key={item}
                  onPress={() => setthinRating(item)}>
                  <Image
                    style={styles.starImgStyle}
                    source={
                      item <= thinRating
                        ? {uri: startImgFilled}
                        : {uri: starImgCorner}
                    }
                  />
                </TouchableOpacity>
              );
            })}
          </View>
        );
      };

      const LongFinishRatingFonc = () => {
        return (
          <View style={styles.customRatingBarStyle}>
            {maxRating.map((item, key) => {
              return (
                <TouchableOpacity
                  activeOpacity={0.7}
                  key={item}
                  onPress={() => setlongfinishRating(item)}>
                  <Image
                    style={styles.starImgStyle}
                    source={
                      item <= longfinishRating
                        ? {uri: startImgFilled}
                        : {uri: starImgCorner}
                    }
                  />
                </TouchableOpacity>
              );
            })}
          </View>
        );
      };

      const BalanceRatingFonc = () => {
        return (
          <View style={styles.customRatingBarStyle}>
            {maxRating.map((item, key) => {
              return (
                <TouchableOpacity
                  activeOpacity={0.7}
                  key={item}
                  onPress={() => setbalanceRating(item)}>
                  <Image
                    style={styles.starImgStyle}
                    source={
                      item <= balanceRating
                        ? {uri: startImgFilled}
                        : {uri: starImgCorner}
                    }
                  />
                </TouchableOpacity>
              );
            })}
          </View>
        );
      };

      const ComplexRatingFonc = () => {
        return (
          <View style={styles.customRatingBarStyle}>
            {maxRating.map((item, key) => {
              return (
                <TouchableOpacity
                  activeOpacity={0.7}
                  key={item}
                  onPress={() => setcomplexRating(item)}>
                  <Image
                    style={styles.starImgStyle}
                    source={
                      item <= complexRating
                        ? {uri: startImgFilled}
                        : {uri: starImgCorner}
                    }
                  />
                </TouchableOpacity>
              );
            })}
          </View>
        );
      };

      const ElegantRatingFonc = () => {
        return (
          <View style={styles.customRatingBarStyle}>
            {maxRating.map((item, key) => {
              return (
                <TouchableOpacity
                  activeOpacity={0.7}
                  key={item}
                  onPress={() => setelegantRating(item)}>
                  <Image
                    style={styles.starImgStyle}
                    source={
                      item <= elegantRating
                        ? {uri: startImgFilled}
                        : {uri: starImgCorner}
                    }
                  />
                </TouchableOpacity>
              );
            })}
          </View>
        );
      };

      const ChewyRatingFonc = () => {
        return (
          <View style={styles.customRatingBarStyle}>
            {maxRating.map((item, key) => {
              return (
                <TouchableOpacity
                  activeOpacity={0.7}
                  key={item}
                  onPress={() => setchewyRating(item)}>
                  <Image
                    style={styles.starImgStyle}
                    source={
                      item <= chewyRating
                        ? {uri: startImgFilled}
                        : {uri: starImgCorner}
                    }
                  />
                </TouchableOpacity>
              );
            })}
          </View>
        );
      };

      const SoftRatingFonc = () => {
        return (
          <View style={styles.customRatingBarStyle}>
            {maxRating.map((item, key) => {
              return (
                <TouchableOpacity
                  activeOpacity={0.7}
                  key={item}
                  onPress={() => setsoftRating(item)}>
                  <Image
                    style={styles.starImgStyle}
                    source={
                      item <= softRating
                        ? {uri: startImgFilled}
                        : {uri: starImgCorner}
                    }
                  />
                </TouchableOpacity>
              );
            })}
          </View>
        );
      };

      const SilkRatingFonc = () => {
        return (
          <View style={styles.customRatingBarStyle}>
            {maxRating.map((item, key) => {
              return (
                <TouchableOpacity
                  activeOpacity={0.7}
                  key={item}
                  onPress={() => setsilkyRating(item)}>
                  <Image
                    style={styles.starImgStyle}
                    source={
                      item <= silkyRating
                        ? {uri: startImgFilled}
                        : {uri: starImgCorner}
                    }
                  />
                </TouchableOpacity>
              );
            })}
          </View>
        );
      };

      const BurnRatingFonc = () => {
        return (
          <View style={styles.customRatingBarStyle}>
            {maxRating.map((item, key) => {
              return (
                <TouchableOpacity
                  activeOpacity={0.7}
                  key={item}
                  onPress={() => setburnRating(item)}>
                  <Image
                    style={styles.starImgStyle}
                    source={
                      item <= burnRating
                        ? {uri: startImgFilled}
                        : {uri: starImgCorner}
                    }
                  />
                </TouchableOpacity>
              );
            })}
          </View>
        );
      };

      
      const JammyRatingFonc = () => {
        return (
          <View style={styles.customRatingBarStyle}>
            {maxRating.map((item, key) => {
              return (
                <TouchableOpacity
                  activeOpacity={0.7}
                  key={item}
                  onPress={() => setjammyRating(item)}>
                  <Image
                    style={styles.starImgStyle}
                    source={
                      item <= jammyRating
                        ? {uri: startImgFilled}
                        : {uri: starImgCorner}
                    }
                  />
                </TouchableOpacity>
              );
            })}
          </View>
        );
      };

      const BellPepperRatingFonc = () => {
        return (
          <View style={styles.customRatingBarStyle}>
            {maxRating.map((item, key) => {
              return (
                <TouchableOpacity
                  activeOpacity={0.7}
                  key={item}
                  onPress={() => setbellpepperRating(item)}>
                  <Image
                    style={styles.starImgStyle}
                    source={
                      item <= bellpepperRating
                        ? {uri: startImgFilled}
                        : {uri: starImgCorner}
                    }
                  />
                </TouchableOpacity>
              );
            })}
          </View>
        );
      };

      const SpicyRatingFonc = () => {
        return (
          <View style={styles.customRatingBarStyle}>
            {maxRating.map((item, key) => {
              return (
                <TouchableOpacity
                  activeOpacity={0.7}
                  key={item}
                  onPress={() => setspicyRating(item)}>
                  <Image
                    style={styles.starImgStyle}
                    source={
                      item <= spicyRating
                        ? {uri: startImgFilled}
                        : {uri: starImgCorner}
                    }
                  />
                </TouchableOpacity>
              );
            })}
          </View>
        );
      };

      const ToastyRatingFonc = () => {
        return (
          <View style={styles.customRatingBarStyle}>
            {maxRating.map((item, key) => {
              return (
                <TouchableOpacity
                  activeOpacity={0.7}
                  key={item}
                  onPress={() => settoastyRating(item)}>
                  <Image
                    style={styles.starImgStyle}
                    source={
                      item <= toastyRating
                        ? {uri: startImgFilled}
                        : {uri: starImgCorner}
                    }
                  />
                </TouchableOpacity>
              );
            })}
          </View>
        );
      };

      const OakRatingFonc = () => {
        return (
          <View style={styles.customRatingBarStyle}>
            {maxRating.map((item, key) => {
              return (
                <TouchableOpacity
                  activeOpacity={0.7}
                  key={item}
                  onPress={() => setoakRating(item)}>
                  <Image
                    style={styles.starImgStyle}
                    source={
                      item <= oakRating
                        ? {uri: startImgFilled}
                        : {uri: starImgCorner}
                    }
                  />
                </TouchableOpacity>
              );
            })}
          </View>
        );
      };

      const VegetableRatingFonc = () => {
        return (
          <View style={styles.customRatingBarStyle}>
            {maxRating.map((item, key) => {
              return (
                <TouchableOpacity
                  activeOpacity={0.7}
                  key={item}
                  onPress={() => setvegetableRating(item)}>
                  <Image
                    style={styles.starImgStyle}
                    source={
                      item <= vegetableRating
                        ? {uri: startImgFilled}
                        : {uri: starImgCorner}
                    }
                  />
                </TouchableOpacity>
              );
            })}
          </View>
        );
      };

      const MineralityRatingFonc = () => {
        return (
          <View style={styles.customRatingBarStyle}>
            {maxRating.map((item, key) => {
              return (
                <TouchableOpacity
                  activeOpacity={0.7}
                  key={item}
                  onPress={() => setmineralityRating(item)}>
                  <Image
                    style={styles.starImgStyle}
                    source={
                      item <= mineralityRating
                        ? {uri: startImgFilled}
                        : {uri: starImgCorner}
                    }
                  />
                </TouchableOpacity>
              );
            })}
          </View>
        );
      };

      const RubberRatingFonc = () => {
        return (
          <View style={styles.customRatingBarStyle}>
            {maxRating.map((item, key) => {
              return (
                <TouchableOpacity
                  activeOpacity={0.7}
                  key={item}
                  onPress={() => setrubberRating(item)}>
                  <Image
                    style={styles.starImgStyle}
                    source={
                      item <= rubberRating
                        ? {uri: startImgFilled}
                        : {uri: starImgCorner}
                    }
                  />
                </TouchableOpacity>
              );
            })}
          </View>
        );
      };

      const SmokyRatingFonc = () => {
        return (
          <View style={styles.customRatingBarStyle}>
            {maxRating.map((item, key) => {
              return (
                <TouchableOpacity
                  activeOpacity={0.7}
                  key={item}
                  onPress={() => setsmokyRating(item)}>
                  <Image
                    style={styles.starImgStyle}
                    source={
                      item <= smokyRating
                        ? {uri: startImgFilled}
                        : {uri: starImgCorner}
                    }
                  />
                </TouchableOpacity>
              );
            })}
          </View>
        );
      };

      const AgeOfWineRatingFonc = () => {
        return (
          <View style={styles.customRatingBarStyle}>
            {maxRating.map((item, key) => {
              return (
                <TouchableOpacity
                  activeOpacity={0.7}
                  key={item}
                  onPress={() => setageofwineRating(item)}>
                  <Image
                    style={styles.starImgStyle}
                    source={
                      item <= ageofwineRating
                        ? {uri: startImgFilled}
                        : {uri: starImgCorner}
                    }
                  />
                </TouchableOpacity>
              );
            })}
          </View>
        );
      };
  
    // const navigation = useNavigation();
  
    const {height} = useWindowDimensions();
  
    const onPressMenuBtn = () => {
      console.warn('onPressMenuBtn');
      // navigation.navigate('SideMenuScreen');
    };
  
    const onPressHomeBtn = () => {
      console.warn('onPressHomeBtn');
      // navigation.navigate('HomeScreenTastingScreen');
    };
  
    const onPressBackBtn = () => {
      console.warn('onPressBackBtn');
    };
  
    const onPressSubmitBtn = () => {
      console.warn('onPressSubmitBtn');
    };
    return (
        <ScrollView>
              <View style={styles.itemsContainer}>
                <View>
                  <Text
                    style={{
                      fontFamily: 'Inter-Bold',
                      fontSize: 14,
                      color: '#3F0321',
                      letterSpacing: 2,
                    }}>
                    FRUIT FORWARD
                  </Text>
                </View>
                <View style={styles.ratingStarsStyle}>
                  <FruitForwardRatingFonc />
                </View>
              </View>
  
              <View style={styles.itemsContainer}>
                <View>
                  <Text
                    style={{
                      fontFamily: 'Inter-Bold',
                      fontSize: 14,
                      color: '#3F0321',
                      letterSpacing: 2,
                    }}>
                    BERRYS
                  </Text>
                </View>
                <View style={styles.ratingStarsStyle}>
                  <BerrysRatingFonc />
                </View>
              </View>
  
              <View style={styles.itemsContainer}>
                <View>
                  <Text
                    style={{
                      fontFamily: 'Inter-Bold',
                      fontSize: 14,
                      color: '#3F0321',
                      letterSpacing: 2,
                    }}>
                    FULL-BODIED
                  </Text>
                </View>
                <View style={styles.ratingStarsStyle}>
                  <FullBodiedRatingFonc />
                </View>
              </View>
  
              <View style={styles.itemsContainer}>
                <View>
                  <Text
                    style={{
                      fontFamily: 'Inter-Bold',
                      fontSize: 14,
                      color: '#3F0321',
                      letterSpacing: 2,
                    }}>
                    THIN
                  </Text>
                </View>
                <View style={styles.ratingStarsStyle}>
                  <ThinRatingFonc />
                </View>
              </View>
  
              <View style={styles.itemsContainer}>
                <View>
                  <Text
                    style={{
                      fontFamily: 'Inter-Bold',
                      fontSize: 14,
                      color: '#3F0321',
                      letterSpacing: 2,
                    }}>
                    LONG FINISH
                  </Text>
                </View>
                <View style={styles.ratingStarsStyle}>
                  <LongFinishRatingFonc />
                </View>
              </View>
  
              <View style={styles.itemsContainer}>
                <View>
                  <Text
                    style={{
                      fontFamily: 'Inter-Bold',
                      fontSize: 14,
                      color: '#3F0321',
                      letterSpacing: 2,
                    }}>
                    BALANCE
                  </Text>
                </View>
                <View style={styles.ratingStarsStyle}>
                  <BalanceRatingFonc />
                </View>
              </View>
  
              <View style={styles.itemsContainer}>
                <View>
                  <Text
                    style={{
                      fontFamily: 'Inter-Bold',
                      fontSize: 14,
                      color: '#3F0321',
                      letterSpacing: 2,
                    }}>
                    COMPLEX
                  </Text>
                </View>
                <View style={styles.ratingStarsStyle}>
                  <ComplexRatingFonc />
                </View>
              </View>
  
              <View style={styles.itemsContainer}>
                <View>
                  <Text
                    style={{
                      fontFamily: 'Inter-Bold',
                      fontSize: 14,
                      color: '#3F0321',
                      letterSpacing: 2,
                    }}>
                    ELEGANT
                  </Text>
                </View>
                <View style={styles.ratingStarsStyle}>
                  <ElegantRatingFonc />
                </View>
              </View>
  
              <View style={styles.itemsContainer}>
                <View>
                  <Text
                    style={{
                      fontFamily: 'Inter-Bold',
                      fontSize: 14,
                      color: '#3F0321',
                      letterSpacing: 2,
                    }}>
                    CHEWY
                  </Text>
                </View>
                <View style={styles.ratingStarsStyle}>
                  <ChewyRatingFonc />
                </View>
              </View>
  
              <View style={styles.itemsContainer}>
                <View>
                  <Text
                    style={{
                      fontFamily: 'Inter-Bold',
                      fontSize: 14,
                      color: '#3F0321',
                      letterSpacing: 2,
                    }}>
                    SOFT
                  </Text>
                </View>
                <View style={styles.ratingStarsStyle}>
                  <SoftRatingFonc />
                </View>
              </View>
  
              <View style={styles.itemsContainer}>
                <View>
                  <Text
                    style={{
                      fontFamily: 'Inter-Bold',
                      fontSize: 14,
                      color: '#3F0321',
                      letterSpacing: 2,
                    }}>
                    SILKY
                  </Text>
                </View>
                <View style={styles.ratingStarsStyle}>
                  <SilkRatingFonc />
                </View>
              </View>
  
              <View style={styles.itemsContainer}>
                <View>
                  <Text
                    style={{
                      fontFamily: 'Inter-Bold',
                      fontSize: 14,
                      color: '#3F0321',
                      letterSpacing: 2,
                    }}>
                    BURN
                  </Text>
                </View>
                <View style={styles.ratingStarsStyle}>
                  <BurnRatingFonc />
                </View>
              </View>
  
              <View style={styles.itemsContainer}>
                <View>
                  <Text
                    style={{
                      fontFamily: 'Inter-Bold',
                      fontSize: 14,
                      color: '#3F0321',
                      letterSpacing: 2,
                    }}>
                    JAMMY
                  </Text>
                </View>
                <View style={styles.ratingStarsStyle}>
                  <JammyRatingFonc />
                </View>
              </View>
  
              <View style={styles.itemsContainer}>
                <View>
                  <Text
                    style={{
                      fontFamily: 'Inter-Bold',
                      fontSize: 14,
                      color: '#3F0321',
                      letterSpacing: 2,
                    }}>
                    BELL PEPPER
                  </Text>
                </View>
                <View style={styles.ratingStarsStyle}>
                  <BellPepperRatingFonc />
                </View>
              </View>
  
              <View style={styles.itemsContainer}>
                <View>
                  <Text
                    style={{
                      fontFamily: 'Inter-Bold',
                      fontSize: 14,
                      color: '#3F0321',
                      letterSpacing: 2,
                    }}>
                    SPICY
                  </Text>
                </View>
                <View style={styles.ratingStarsStyle}>
                  <SpicyRatingFonc />
                </View>
              </View>
  
              <View style={styles.itemsContainer}>
                <View>
                  <Text
                    style={{
                      fontFamily: 'Inter-Bold',
                      fontSize: 14,
                      color: '#3F0321',
                      letterSpacing: 2,
                    }}>
                    TOASTY
                  </Text>
                </View>
                <View style={styles.ratingStarsStyle}>
                  <ToastyRatingFonc />
                </View>
              </View>
  
              <View style={styles.itemsContainer}>
                <View>
                  <Text
                    style={{
                      fontFamily: 'Inter-Bold',
                      fontSize: 14,
                      color: '#3F0321',
                      letterSpacing: 2,
                    }}>
                    OAK
                  </Text>
                </View>
                <View style={styles.ratingStarsStyle}>
                  <OakRatingFonc />
                </View>
              </View>
  
              <View style={styles.itemsContainer}>
                <View>
                  <Text
                    style={{
                      fontFamily: 'Inter-Bold',
                      fontSize: 14,
                      color: '#3F0321',
                      letterSpacing: 2,
                    }}>
                    VEGETABLE
                  </Text>
                </View>
                <View style={styles.ratingStarsStyle}>
                  <VegetableRatingFonc />
                </View>
              </View>
  
              <View style={styles.itemsContainer}>
                <View>
                  <Text
                    style={{
                      fontFamily: 'Inter-Bold',
                      fontSize: 14,
                      color: '#3F0321',
                      letterSpacing: 2,
                    }}>
                    MINERALITY
                  </Text>
                </View>
                <View style={styles.ratingStarsStyle}>
                  <MineralityRatingFonc />
                </View>
              </View>
  
              <View style={styles.itemsContainer}>
                <View>
                  <Text
                    style={{
                      fontFamily: 'Inter-Bold',
                      fontSize: 14,
                      color: '#3F0321',
                      letterSpacing: 2,
                    }}>
                    RUBBER
                  </Text>
                </View>
                <View style={styles.ratingStarsStyle}>
                  <RubberRatingFonc />
                </View>
              </View>
  
              <View style={styles.itemsContainer}>
                <View>
                  <Text
                    style={{
                      fontFamily: 'Inter-Bold',
                      fontSize: 14,
                      color: '#3F0321',
                      letterSpacing: 2,
                    }}>
                    SMOKY
                  </Text>
                </View>
                <View style={styles.ratingStarsStyle}>
                  <SmokyRatingFonc />
                </View>
              </View>
  
              <View style={styles.itemsContainer}>
                <View>
                  <Text
                    style={{
                      fontFamily: 'Inter-Bold',
                      fontSize: 14,
                      color: '#3F0321',
                      letterSpacing: 2,
                    }}>
                    AGE OF WINE
                  </Text>
                </View>
                <View style={styles.ratingStarsStyle}>
                  <AgeOfWineRatingFonc />
                </View>
              </View>
        </ScrollView>
    );
  };
  
  export default WineReview;
  
  const styles = StyleSheet.create({
    root: {
      flex: 1,
      backgroundColor: '#FFFFFF',
    },
    Header: {
      alignItems: 'center',
      borderWidth: 1,
      backgroundColor: '#FFFFFF',
      borderColor: '#EAEAEA',
      shadowRadius: '#EAEAEA',
      shadowColor: 'red',
      display: 'flex',
      flexDirection: 'row',
      justifyContent: 'space-between',
  
      shadowColor: '#000',
      shadowOffset: {
        width: 0,
        height: 1,
      },
      shadowOpacity: 0.18,
      shadowRadius: 1.0,
      elevation: 1,
    },
    logo: {
      width: '45%',
      maxWidth: 300,
      maxHeight: 200,
    },
    backBtnStyle: {
      display: 'flex',
      flexDirection: 'row',
      alignItems: 'center',
      marginTop: 20,
      marginLeft: 20,
    },
    wineDetailContainer: {
      width: '100%',
      alignItems: 'center',
    },
    wineDetailsContainerChild: {
      width: 368,
      height: 144,
      display: 'flex',
      flexDirection: 'row',
      alignItems: 'center',
      borderRadius: 12,
      marginVertical: 20,
  
      borderWidth: 1,
      borderColor: '#D9D9D9',
    },
    reviewContainer: {
      marginHorizontal: 20,
    },
    customRatingBarStyle: {
      display: 'flex',
      flexDirection: 'row',
    },
    starImgStyle: {
      width: 25,
      height: 25,
      resizeMode: 'cover',
      marginHorizontal: 3,
    },
    itemsContainer: {
      display: 'flex',
      flexDirection: 'row',
      alignItems: 'center',
      justifyContent: 'space-between',
      marginTop: 20,
    },
    ratingStarsStyle: {
      marginHorizontal: 5,
    },
    submitBtn:{
      height: 62, 
      width: 368, 
      backgroundColor: '#3F0321', 
      borderRadius: 12, 
      marginBottom: 100, 
      alignItems: 'center', 
      justifyContent: 'center',
    },
  });