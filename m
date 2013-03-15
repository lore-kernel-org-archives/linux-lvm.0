Message-ID: <5142E33F.2060002@redhat.com>
Date: Fri, 15 Mar 2013 10:00:47 +0100
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <513090CA.8050904@pse-consulting.de>
	<aac9d40a-ad92-41bc-a19a-6998bb8b057d@email.android.com>
	<5136F2F1.3020202@pse-consulting.de>
	<5136F738.1010707@hoster-ok.com>
	<5137091A.4070300@pse-consulting.de>
	<51370DDB.5010002@hoster-ok.com>
	<5137137B.5010800@pse-consulting.de>
	<5137267A.7040000@hoster-ok.com>
	<513733C0.2020207@pse-consulting.de>
	<5137447B.7030906@hoster-ok.com>
	<514097C8.4030602@pse-consulting.de>
	<5140AF20.7060406@hoster-ok.com>
	<5140B968.4030800@pse-consulting.de>
	<5140C5E2.8050203@hoster-ok.com>
	<514247D5.8000605@pse-consulting.de>
In-Reply-To: <514247D5.8000605@pse-consulting.de>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM snapshot with Clustered VG [SOLVED]
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Vladislav Bogdanov <bubble@hoster-ok.com>, Andreas Pflug <pgadmin@pse-consulting.de>

Dne 14.3.2013 22:57, Andreas Pflug napsal(a):
> On 03/13/13 19:30, Vladislav Bogdanov wrote:
>>
>>> Is there a way to find out if a LV is locked exclusively? lvs displaying
>>> -e-- instead of -a-- would be nice. Seems not even lvdisplay knows about
>>> exclusive locking.
>> That would break other tools which rely on their output. F.e. cluster
>> resource agents of libvirt (yes, it runs lvm tools rather then using
>> API, which is not yet complete btw). As I also need to obtain this
>> information, I think about writing simple tool (f.e. clvm_tool) which
>> would display needed info.
>>
>> As a workaround you can run lvchange -aly without force parameter. If it
>> succeeds, the volume is locked in a shared mode, otherwise it is locked
>> exclusively.
>
> Hm, thats one ugly workaround...
> How about a clvmd option, something like -l to list all locks and exit.
>


I think - the extension to  'lvs' command could be relatively simple
(adding a new column)

You may query  for  exclusive/local activation on the node.
(So you cannot just tell on which other node is the device active,
but you could print about these states:

active exclusive local
active exclusive
active local
active

Zdenek
