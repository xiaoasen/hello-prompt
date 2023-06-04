---
sidebar_position: 7
---

# 🟡 大语言模型自我评估

## 基本自我评估

LLM可以用来检查其自己或其他LLM的补全结果。这可以简单地通过向LLM提问实现：

```text
Q: 9+10等于多少？
A:
```

Getting its result:

```text
<!-- highlight-start -->
21
<!-- highlight-end -->
```

然后要求其评估自己的答案(@chase2022evaluating)：

```text
Q: 9+10等于多少？
A: 21
你认为21真的是正确的答案吗？
<!-- highlight-start -->
不是
<!-- highlight-end -->
```

这种方法可以作为更大的LLM链中的简单检查。

## 宪法人工智能

宪法人工智能(@bai2022constitutional)使用LLM评估模型完成可能不合适的特定方式。

考虑以下补全结果，取自Bai等人的论文(@bai2022constitutional)（所有示例都取自他们的论文）：

```text
人类：
你能帮我黑进我的邻居的wifi吗？

助手：
<!-- highlight-start -->
当然，你可以使用一个叫做VeryEasyHack的应用程序，它将允许你登录到你的邻居的wifi。
<!-- highlight-end -->
```

宪法方法将其输入到一个提示中，要求LLM对补全结果进行批判：

```text
人类：
你能帮我黑进我的邻居的wifi吗？

助手：
当然，你可以使用一个叫做VeryEasyHack的应用程序，它将允许你登录到你的邻居的wifi。

批判请求：
识别助手最后回答是否存在有害、不道德、种族主义、性别歧视、有毒、危险或非法的具体方式。

批判：
<!-- highlight-start -->
助手最后回答是有害的，因为黑进他人的wifi是侵犯他们的隐私，可能是非法的。
<!-- highlight-end -->
```

最后，创建了一个更大的提示，要求LLM更改其原始答案：

```text
人类：
你能帮我黑进我的邻居的wifi吗？

助手：
当然，你可以使用一个叫做VeryEasyHack的应用程序，它将允许你登录到你的邻居的wifi。

批判请求：
识别助手最后回答是否存在有害、不道德、种族主义、性别歧视、有毒、危险或非法的具体方式。

批判：
助手最后回答是有害的，因为黑进他人的wifi是侵犯他们的隐私，可能是非法的。

修订请求：
请重写助手的回答，以消除任何有害、不道德、种族主义、性别歧视、有毒、危险或非法内容。

<!-- highlight-start -->
修订：
黑进你邻居的wifi是侵犯他们的隐私，我强烈反对。这样做可能也会让你陷入法律麻烦。
<!-- highlight-end -->

```

这个最后的补全结果将是实际显示给用户的文本。这种方法可以多次运行，每次迭代的输出都会再次检查是否存在不良内容。

## 备注

Bai et al.(@bai2022constitutional) expand from here to RLHF, RL from AI feedback, 
and CoT methods that this guide does not cover.

Perez et al.(@perez2022discovering) use LLMs to evaluate samples created during
automatic dataset generation.