Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5DI1c5C014727
	for <linux-lvm@redhat.com>; Tue, 13 Jun 2006 14:01:38 -0400
Received: from orko.netshadow.at (mail.netshadow.at [217.116.182.107])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5DI1Vk9028646
	for <linux-lvm@redhat.com>; Tue, 13 Jun 2006 14:01:36 -0400
Received: from [192.168.191.20] (kuecken.unki.net [192.168.191.20])
	(authenticated bits=0)
	by orko.netshadow.at (8.13.6/8.13.6/Debian-1) with ESMTP id
	k5DI1Gv9005351
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <linux-lvm@redhat.com>; Tue, 13 Jun 2006 20:01:17 +0200
Message-ID: <448EFD65.8090707@netshadow.at>
Date: Tue, 13 Jun 2006 20:01:09 +0200
From: Andreas Unterkircher <unki@netshadow.at>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Re: undelete logical volume
References: <448EEF41.7000404@netshadow.at> <e6mt4v$nlp$1@sea.gmane.org>
In-Reply-To: <e6mt4v$nlp$1@sea.gmane.org>
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

Thx for the hint. Also I found out that a metadata backup is created on
a every command in /etc/lvm/archives.
The lv has been recovered, but it looks like the first xxx bytes of the
lv have changed. Luks doesn't accept it
as luks partition anymore and so I can't mount the encrypted partition
anymore. Data lost.... Backup is always
a good idea...

Andreas

Thomas schrieb:
> Use RIP (R)ecovery (I)s (P)ossible! (v15.2)  to boot up.
> And use command hexdump /dev/hda1 to collect the old LVM config information.
> They are nearly 1200.
> Use the information to create a metadata file.
> Use cfgrestore to recover.
> Then mount back the lost LogVol00.
>
> Just my two cents.
> "Andreas Unterkircher" <unki@netshadow.at> �b�l��
> news:448EEF41.7000404@netshadow.at �����g...
>   
>> Hi,
>>
>> I made a big mistake and deleted a logical volume with some still needed
>>     
> data.
>   
>> It was the only active lv and no other write access happened on the
>>     
> physical
>   
>> disks till yet. Also I have no backup of lvm's metadata.
>>
>> Is there any way to recover the lost logical volume? (lvm2)
>>
>> Andreas
>>
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>>     
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>   
