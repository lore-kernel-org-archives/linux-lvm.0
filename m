Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u28Fapqd008892
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Tue, 8 Mar 2016 10:36:51 -0500
Received: from nm37-vm9.bullet.mail.ir2.yahoo.com
	(nm37-vm9.bullet.mail.ir2.yahoo.com [212.82.97.150])
	by mx1.redhat.com (Postfix) with ESMTPS id 4518F64394
	for <linux-lvm@redhat.com>; Tue,  8 Mar 2016 15:36:50 +0000 (UTC)
References: <56DDBAF8.8040105@yahoo.co.uk>
	<22237.56958.981481.778563@quad.stoffel.home>
	<20160308111228.GA18072@hex.gsslab.fab.redhat.com>
	<56DEDB6D.2030502@yahoo.co.uk> <56DEDE57.5000701@redhat.com>
From: lejeczek <peljasz@yahoo.co.uk>
Message-ID: <56DEF183.4090603@yahoo.co.uk>
Date: Tue, 8 Mar 2016 15:36:35 +0000
MIME-Version: 1.0
In-Reply-To: <56DEDE57.5000701@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] [Bulk] Re: lvm protected against crypt/luks
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

On 08/03/16 14:14, Ondrej Kozina wrote:
> On 03/08/2016 03:02 PM, lejeczek wrote:
>> superb, thanks chaps,
>> on keyfiles, would you know why this:
>>
>> cryptsetup luksOpen /dev/h300Int1/0 h300Int1.0_crypt
>> /etc/crypttab.key --keyfile-offset 12
>>
>
> IIUC it seems like missing -d/--key-file option in front 
> of "/etc/crypttab.key" string. Well it also depends on 
> actual content of your /etc/crypttab.key file. Does it 
> really contain backup of your keyslot passphrase (human 
> readable text data)? Or does it contain volume key for 
> your luks device (usually looks like binary data, bunch of 
> random bytes that really should not be human readable:))
>
> Regards
> Ondrej
many thanks Onrej,
it seems I got it completely wrong, the concept of it, I 
thought the keyfile is pure randomness and I just simply 
pick up a chunk of it with the help of offest.
But why then it works fine without offset, with no 
passphrase in keyfile at any time?
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
