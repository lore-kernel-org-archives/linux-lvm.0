Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0UH4PO06013
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2005 12:04:25 -0500
Received: from postfix2-c.free.fr (postfix2-c.free.fr [213.228.0.80])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j0UH4Obn014176
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2005 12:04:24 -0500
Received: from postfix3-2.free.fr (postfix3-2.free.fr [213.228.0.169])
	by postfix2-c.free.fr (Postfix) with ESMTP id A0E21A2D3BD
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2005 18:04:23 +0100 (CET)
Received: from eric.placeverte.home
	(lns-vlq-7-lil-82-254-193-239.adsl.proxad.net [82.254.193.239])
	by postfix3-2.free.fr (Postfix) with SMTP id 537AEC153
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2005 18:04:21 +0100 (CET)
Date: Sun, 30 Jan 2005 18:04:20 +0100
From: messmate <messmate@free.fr>
Subject: Re: [linux-lvm] converting ext3 / to LVM
Message-ID: <20050130180420.271340f7@eric.placeverte.home>
In-Reply-To: <1107084645l.24357l.2l@tangerine-64>
References: <006901c5069a$db39b690$4857fea9@desktop>
	<1107077143l.22995l.0l@tangerine-64>
	<20050130115544.65cfaef3@eric.placeverte.home>
	<1107084645l.24357l.2l@tangerine-64>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sun, 30 Jan 2005 11:30:45 +0000
"Jean-Luc Coulon (f5ibh)" <jean-luc.coulon@wanadoo.fr> wrote:

>Le 30.01.2005 11:55:44, messmate a �crit�:
>> On Sun, 30 Jan 2005 09:25:43 +0000
>> "Jean-Luc Coulon (f5ibh)" <jean-luc.coulon@wanadoo.fr> wrote:
>> 
>>> Le 30.01.2005 08:10:52, matthew zeier a �crit�:
>>>> 
>>>> Are there any tips on converting an existing ext3 / to LVM?
>> 
>> Be carefull; as I know converting an EXISTING ext3 to LVM loses all
>> data.
>> Jean-Luc, can  you confirm this ??
>
>Tell us *how* you plan to convert it to lvm.
>
>J-L
>
Reading section 12.3 on the LVM HowTo; there is no good way migrating an
existing filesystem ( with data) to lvm !
I'm in doubt if LVM is very usefull following what this howto recommend.
EVMS more suitable?
mess-mate
Sorry, I mean 12.1
