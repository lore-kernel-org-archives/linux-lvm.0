Received: from [10.34.131.9] (dhcp131-9.brq.redhat.com [10.34.131.9])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4V8XaFm030312
	for <linux-lvm@redhat.com>; Tue, 31 May 2016 04:33:37 -0400
References: <574B1DC9.2090700@ubuntu.com>
	<db139f28-5020-31b2-abc6-80c94daf7bdb@redhat.com>
	<574C9A2E.1080109@ubuntu.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <3d80d548-a150-8d85-05bb-33d2567632f8@redhat.com>
Date: Tue, 31 May 2016 10:33:36 +0200
MIME-Version: 1.0
In-Reply-To: <574C9A2E.1080109@ubuntu.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM says physical volumes are missing,
	but they are not
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
To: linux-lvm@redhat.com

Dne 30.5.2016 v 21:53 Phillip Susi napsal(a):
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA512
>
> On 05/30/2016 04:15 AM, Zdenek Kabelac wrote:
>> Hi
>>
>> Please provide full 'vgchage -ay -vvvv' trace of such activation
>> command.
>>
>> Also specify which version of lvm2 is in use by your distro.
>
> 2.02.133-1ubuntu10.  I ended up fixing it by doing a vgcfgbackup,
> manually editing the text file to remove the MISSING flags, and then

Hi

Instead of doing manual 'edit' you should have used:

vgextend --restoremissing  /dev/your_restored_pv

If you do a manual edit - there is quite large probability the restored
device will cause data inconsistencies for raid/mirrors....


(And complementary command if you would have wanted to drop a missing PV:
vgreduce --removemissing)


Regards

Zdenek
