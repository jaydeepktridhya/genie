package ai.genie.app.util

object Constant {

    //Open AI
    const val BASE_URL = "https://api.openai.com"
    const val BASE_URL_TYPEWISE = "https://typewise-ai.p.rapidapi.com"
    const val AUTH_TOKEN = "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"
    const val AUTH_TOKEN_TYPEWISE = "340d3275bdmshaf84670e55123fcp182958jsn6f5b4c32bfe1"
    const val TYPEWISE_HOST = "typewise-ai.p.rapidapi.com"
    const val TRANSLATE = "Translate"
    const val GRAMMAR_CHECK = "GrammarCheck"
    const val PARAPHRASE = "Paraphrase"
    const val CONTINUE_WRITING = "ContinueWriting"
    const val EMAIL_REPLY = "EmailReply"
    const val HELP_ME_WRITE = "HelpMeWrite"

    object Translate {
        fun getTranslate(): ArrayList<String> {
            val translateList = ArrayList<String>()
            translateList.add("English")
            translateList.add("Spanish")
            translateList.add("French")
            translateList.add("German")
            translateList.add("Japanese")
            translateList.add("Chinese")
            translateList.add("Hindi")
            translateList.add("Italian")
            translateList.add("Deutsch")
            return translateList
        }
    }

    object EmailReply {
        fun getEmailReply(): ArrayList<String> {
            val emailReplyList = ArrayList<String>()
            emailReplyList.add("Interested")
            emailReplyList.add("Respectful")
            emailReplyList.add("Casual")
            emailReplyList.add("Thankful")
            emailReplyList.add("Negotiation")
            emailReplyList.add("Explanatory")
            emailReplyList.add("Persuasive")
            emailReplyList.add("Empathetic")
            emailReplyList.add("Informative")
            emailReplyList.add("Argumentative")
            emailReplyList.add("Descriptive")
            emailReplyList.add("Analytical")
            emailReplyList.add("Suggestive")
            emailReplyList.add("Inspirational")
            return emailReplyList
        }
    }

    object Paraphrase {
        fun getParaphrase(): ArrayList<String> {
            val paraphraseList = ArrayList<String>()
            paraphraseList.add("Professional")
            paraphraseList.add("Plain Language")
            paraphraseList.add("Informal")
            paraphraseList.add("Formal")
            paraphraseList.add("Poetry")
            paraphraseList.add("Funny")
            paraphraseList.add("Flirty")
            paraphraseList.add("Pickup line")
            paraphraseList.add("Explanatory")
            paraphraseList.add("Persuasive")
            paraphraseList.add("Empathetic")
            paraphraseList.add("Informative")
            paraphraseList.add("Argumentative")
            paraphraseList.add("Descriptive")
            paraphraseList.add("Analytical")
            paraphraseList.add("Suggestive")
            paraphraseList.add("Inspirational")
            return paraphraseList
        }
    }
}