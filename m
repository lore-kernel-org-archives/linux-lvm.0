Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0UAtpO22030
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2005 05:55:51 -0500
Received: from postfix1-c.free.fr (postfix1-c.free.fr [213.228.0.79])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j0UAtoTV014952
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2005 05:55:50 -0500
Received: from postfix4-2.free.fr (postfix4-2.free.fr [213.228.0.176])
	by postfix1-c.free.fr (Postfix) with ESMTP id 760F9C3654F
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2005 11:55:49 +0100 (CET)
Received: from eric.placeverte.home
	(lns-vlq-7-lil-82-254-193-239.adsl.proxad.net [82.254.193.239])
	by postfix4-2.free.fr (Postfix) with SMTP id C64102BC4F6
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2005 11:55:45 +0100 (CET)
Date: Sun, 30 Jan 2005 11:55:44 +0100
From: messmate <messmate@free.fr>
Subject: Re: [linux-lvm] converting ext3 / to LVM
Message-ID: <20050130115544.65cfaef3@eric.placeverte.home>
In-Reply-To: <1107077143l.22995l.0l@tangerine-64>
References: <006901c5069a$db39b690$4857fea9@desktop>
	<1107077143l.22995l.0l@tangerine-64>
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

On Sun, 30 Jan 2005 09:25:43 +0000
"Jean-Luc Coulon (f5ibh)" <jean-luc.coulon@wanadoo.fr> wrote:

>Le 30.01.2005 08:10:52, matthew zeier a �crit�:
>> 
>> Are there any tips on converting an existing ext3 / to LVM? 

Be carefull; as I know converting an EXISTING ext3 to LVM loses all
data. 
Jean-Luc, can  you confirm this ??

>> I found  
>> something that talks about ext2 using LVM1 but I'm not sure if that  
>> applies to my system (RHEL ES v3).
>
>LVM is not a filestem and is not aware of the filesystem you will  
>install on it.
>
>I've installed xfs filesystem over lvm with the same instructions as  
>for ext2.
>
>Only the tolls to resize the ilesystem are different.
>Some filesystems needs to be mounted, other to be unmounted.
>i.e: you can reeeeize an xfs only if t is mounted and you cannot  
>schrink it, only growing is avalable.
>
>> 
>> --
>> matthew zeier
>
>Jean-Luc
>
