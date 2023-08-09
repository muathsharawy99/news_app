abstract class NewsState{}
class InitState extends NewsState{}

class ChangeLayoutIndex extends NewsState{}

class GetSportsNewsLoading extends NewsState{}
class GetSportsNewsSuccess extends NewsState{}
class GetSportsNewsError extends NewsState{}

class GetScienceNewsLoading extends NewsState{}
class GetScienceNewsSuccess extends NewsState{}
class GetScienceNewsError extends NewsState{}

class GetTechNewsSuccess extends NewsState{}
class GetTechNewsLoading extends NewsState{}
class GetTechNewsError extends NewsState{}

class ChangeCountryLoadingState extends NewsState{}
class ChangeCountrySuccessState extends NewsState{}
class ChangeCountryErrorState extends NewsState{}

class SetCountryEgyLoadingState extends NewsState{}
class SetCountryEgySuccessState extends NewsState{}