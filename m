Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0CIsgr23901
	for <linux-lvm@redhat.com>; Wed, 12 Jan 2005 13:54:42 -0500
Received: from postfix4-1.free.fr (postfix4-1.free.fr [213.228.0.62])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j0CIsVLA018718
	for <linux-lvm@redhat.com>; Wed, 12 Jan 2005 13:54:37 -0500
Received: from eric.placeverte.home
	(lns-vlq-7-lil-82-254-196-161.adsl.proxad.net [82.254.196.161])
	by postfix4-1.free.fr (Postfix) with SMTP id 0AB112640BF
	for <linux-lvm@redhat.com>; Wed, 12 Jan 2005 19:54:30 +0100 (CET)
Date: Wed, 12 Jan 2005 19:54:30 +0100
From: messmate <messmate@free.fr>
Subject: Re: [linux-lvm] strange logical volume issue
Message-ID: <20050112195430.7456b0a3@eric.placeverte.home>
In-Reply-To: <9053-04726@sneakemail.com>
References: <20050110234240.749ebab3@eric.placeverte.home>
	<20050111142411.GU26670@agk.surrey.redhat.com>
	<9053-04726@sneakemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 11 Jan 2005 16:25:23 +0000
"Andrew Hilborne" <cseoqs002@sneakemail.com> wrote:

>--On 11 January 2005 14:24 +0000 "Alasdair G Kergon agk@redhat.com"
>wrote:>
>> On Mon, Jan 10, 2005 at 11:42:40PM +0100, messmate wrote:
>>> there is somewhat strange with a lv of mine: lv_usr-local.
>>> Marked as /dev/mapper/vg1_hda1-lv_usr--local    and
>>> as /dev/vg1_hda/lv_usr-local  !
>>>
>>> See the (-) differences.
>>
>> A hyphen in the name in /dev/mapper separates the volume
>> group name from the logical volume name.
>>
>> If you put hyphens in either of those names they
>> get quoted by doubling them up.
>
>Yes indeed. Sadly (I now feel) I created my VG with the name "VG-1" and
>now I see exactly this "problem."
>
>So far as I can see, I have a VG with this naming issue, some LVs with 
>*names" which reflect the same problem, and some entries in /etc/fstab
>(I'm running Debian on this machine, FWIW) which contain associated
>/dev/mapper names.
>
>Now that someone has brought this up, can someone possibly tell me a
>safe way to go about renaming things? I was thinking of something like
>"VG1" :)
>
>--
>Andrew Hilborne
>
I've named my vg's as vg1_hda , stands for:
vg1 =first vg
_hda = first hd.
The underscore seem safe.
mess-mate
