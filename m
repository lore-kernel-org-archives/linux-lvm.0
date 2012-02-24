Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q1O10LvC008905
	for <linux-lvm@redhat.com>; Thu, 23 Feb 2012 20:00:22 -0500
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q1O10KCQ003152
	for <linux-lvm@redhat.com>; Thu, 23 Feb 2012 20:00:21 -0500
Received: by wics10 with SMTP id s10so1552370wic.33
	for <linux-lvm@redhat.com>; Thu, 23 Feb 2012 17:00:20 -0800 (PST)
MIME-Version: 1.0
Date: Fri, 24 Feb 2012 10:00:20 +0900
Message-ID: <CALLsPVhgBoZiPU6GR_UAjE31ZFOjyTkUeF03ddt5_+B6YD=16g@mail.gmail.com>
From: =?EUC-KR?B?udrB2Ljw?= <kunobr@gmail.com>
Content-Type: multipart/alternative; boundary=f46d043c8068e2fa5a04b9ab485a
Subject: [linux-lvm] Question for LVM feasibility and usage on the embedded
	linux
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

--f46d043c8068e2fa5a04b9ab485a
Content-Type: text/plain; charset=ISO-8859-1

Dears,

Nice to meet you. This is Junmo from Korea who is in charge of embedded
system development on Android.
I have some questions for the LVM. Could you kindly tell me about question
below?

Actually, i know that LVM solution is very attractive for engineer and/or
system which have multiple disks.
But, in my case, i have a only one disk(2TB) and i need to expand/shrink
the partition dynamically according to the user request while file systems
are online(without reboot or backup).

This is my system specification.

Kernel ver : 2.6.39.4
OS : Android ICS
Platform : Armv7
HDD : 2TB

Requested Feature
1) expand/shrink the partition dynamically according to the user request.
2) space limitation per each partition or directory.

This is my user scenario.
1) Let's say that 500G is for shared folder and another 500G is for
multimedia folder. And 1TB is a free disk space.
2) shared folder can use additional free disk at any time up to 1TB
freely if free space is available.. But, multimedia folder can't use
additional space without user permission and it can use only 500G space.
3) Let's say shared folder have 1.5TB now. But,if multimedia folder want to
expand their space with 500G(Total 1TB), system MUST allocate additional
space to multimedia folder.  In this case, shared folder should be shrunk
to 1TB and multimedia folder should be expanded up to 1TB.
4) Now, user can't write the data to the each folder over 1TB.


1) Does LVM suitable solution for me?( only 2TB one disk)
2) Do you know any case study on embedded system or similar with my
situation?
3) Could you give me any comments or guidance?

Thanks in advance.

/Junmo

--f46d043c8068e2fa5a04b9ab485a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Dears,<div><br></div><div>Nice to meet you. This is Junmo from Korea who is=
 in charge of=A0embedded system=A0development on Android.</div><div>I have =
some questions for the LVM. Could you kindly tell me about question below?<=
/div>
<div><br></div><div>Actually, i know that LVM solution is very attractive f=
or engineer and/or system which have multiple disks.</div><div>But, in my c=
ase, i have a only one disk(2TB) and i need to expand/shrink the partition =
dynamically according to the user request while file systems are online(wit=
hout reboot or backup).</div>
<div><br></div><div>This is my system specification.</div><div><br></div><d=
iv>Kernel ver : 2.6.39.4</div><div>OS : Android ICS</div><div>Platform : Ar=
mv7</div><div>HDD : 2TB</div><div><br></div><div>Requested Feature</div>
<div>1)=A0expand/shrink the partition dynamically according to the user req=
uest.</div><div>2) space limitation per each partition or directory.</div><=
div><br></div><div>This is my user scenario.</div><div>1) Let&#39;s say tha=
t 500G is for shared folder and another 500G is for multimedia folder. And =
1TB is a free disk space.</div>
<div>2) shared folder can use additional free disk at any time=A0up to 1TB =
freely=A0if free space is available.. But, multimedia folder can&#39;t use =
additional space without user permission and it can use only 500G space.</d=
iv>
<div>3)=A0Let&#39;s say shared folder have 1.5TB now.=A0But,if multimedia f=
older want to expand their space with 500G(Total 1TB), system MUST allocate=
 additional space to multimedia folder. =A0In this case, shared folder shou=
ld be shrunk to 1TB and multimedia folder should be expanded up to 1TB.=A0<=
/div>
<div>4) Now, user can&#39;t write the data to the each folder over 1TB.</di=
v><div><br></div><div><br></div><div>1) Does LVM suitable solution for me?(=
 only 2TB one disk)</div><div>2) Do you know any case study on embedded sys=
tem or similar with my situation?</div>
<div>3) Could you give me any comments or guidance?</div><div><br></div><di=
v>Thanks in advance.</div><div><br></div><div>/Junmo</div><div><br></div>

--f46d043c8068e2fa5a04b9ab485a--
