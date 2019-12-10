Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A14E52026D69
	for <linux-lvm@redhat.com>; Tue, 10 Dec 2019 03:24:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 288A518E756B
	for <linux-lvm@redhat.com>; Tue, 10 Dec 2019 03:24:18 +0000 (UTC)
From: Heming Zhao <heming.zhao@suse.com>
Date: Tue, 10 Dec 2019 03:23:52 +0000
Message-ID: <b554a2f4-5157-d2be-6a36-2ed9aa787e55@suse.com>
References: <9fdc2f47-a4db-f472-e1eb-424f6a6b28d9@suse.com>
	<b43b63a0-440f-3270-aeb5-dd8cf99ffcf0@redhat.com>
	<efb74841-6424-aa2d-0067-019b31240bd8@suse.com>
	<47ab183b-3a61-24f1-77e8-1d3aa2cf3c29@redhat.com>
In-Reply-To: <47ab183b-3a61-24f1-77e8-1d3aa2cf3c29@redhat.com>
Content-Language: en-US
Content-ID: <475A7FBF1BAC034D8E100D557D06F9B6@namprd18.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] It looks wrong for the timeout when lvm test running
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
Content-Type: text/plain; charset="utf-8"
To: Zdenek Kabelac <zkabelac@redhat.com>, LVM general discussion and
	development <linux-lvm@redhat.com>

Hello Zdenek,

Thank you for your feedback.
When I switched to ramdisk backend devices, the time consuming is about 9s.

I raised this topic for there may have a bug in timeout related codes,
not for why the snapshot-merge.sh costs too much time.

The code in below overwrite silent_start when select() successfully return.
```
           if ( select( nfds, &set, NULL, NULL, &wait ) > 0 ) {
               silent_start = end; /* something happened */ <====== this line!
               io.sync( false );
           }
```

Thanks.

On 12/9/19 7:36 PM, Zdenek Kabelac wrote:
> Dne 09. 12. 19 v 11:58 Heming Zhao napsal(a):
>> Hello Zdenek,
>>
>> Please check the compressed file in attachment.
>>
>>>
>> On 12/9/19 5:40 PM, Zdenek Kabelac wrote:
>>> Dne 09. 12. 19 v 10:20 Heming Zhao napsal(a):
>>>> Hello List,
>>>>
>>>> The lvm test default timeout (--timeout) default value is 180.
>>>> But I met below condition when running testcase (in virtual machine):
>>>> ```
>>>> make check_local T=shell/snapshot-merge.sh
>>>> ����� ... ...
>>>> ###������ passed: [ndev-vanilla] shell/snapshot-merge.sh 665
>>>> ����� ... ...
>>>> ```
> 
> 
> Hi
> 
> 
> So your test seems to be very slow in 'mkfs.ext4':
> 
> [ 0:03] Creating journal (4096 blocks): done
> [ 1:30] Writing superblocks and filesystem accounting information: done
> ....
> [ 1:34] Creating journal (4096 blocks): done
> [ 3:03] Writing superblocks and filesystem accounting information: done
> ....
> [ 3:07] Creating journal (4096 blocks): done
> [ 4:37] Writing superblocks and filesystem accounting information: done
> ....
> [ 4:40] Creating journal (4096 blocks): done
> [ 6:08] Writing superblocks and filesystem accounting information: done
> ....
> 
> 
> This looks certainly seriously like a very slow (possibly doing TRIM) ??
> Any idea why ?
> 
> The test seems to be using loop device created in backend file in your /tmp
> (i.e.: losetup /dev/loop0 /tmp/LVMTEST11574.cJtNfnlPrj/test.img)
> 
> So any idea why your virtual machine is that slow with handling this case ?
> 
> One idea - aren't you using a storage with very slow discard processing
> (i.e. ATM VDO) ?
> 
> You can setup different backend device or different location of test dir
> (see 'make help' in test subdir)
> 
> Regards
> 
> Zdenek
> 
