Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u28E2VTw016522
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Tue, 8 Mar 2016 09:02:31 -0500
Received: from nm11-vm8.bullet.mail.ir2.yahoo.com
	(nm11-vm8.bullet.mail.ir2.yahoo.com [212.82.96.169])
	by mx1.redhat.com (Postfix) with ESMTPS id A0AAFD479A
	for <linux-lvm@redhat.com>; Tue,  8 Mar 2016 14:02:29 +0000 (UTC)
References: <56DDBAF8.8040105@yahoo.co.uk>
	<22237.56958.981481.778563@quad.stoffel.home>
	<20160308111228.GA18072@hex.gsslab.fab.redhat.com>
From: lejeczek <peljasz@yahoo.co.uk>
Message-ID: <56DEDB6D.2030502@yahoo.co.uk>
Date: Tue, 8 Mar 2016 14:02:21 +0000
MIME-Version: 1.0
In-Reply-To: <20160308111228.GA18072@hex.gsslab.fab.redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] [Bulk] Re:  lvm protected against crypt/luks
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

On 08/03/16 11:12, Bryn M. Reeves wrote:
> On Mon, Mar 07, 2016 at 03:03:10PM -0500, John Stoffel wrote:
>> lejeczek> Do I need to wipe block devices clean off any LVM traces in
>> lejeczek> order to encrypt them?
>>
>> No... but it's probably a good idea to do so initially, which is
>> really to just zero it out. But LV information is stored within the
>> VG, which is stored within the PVs which make it up.
> Better to overwrite it with garbage (/dev/urandom for e.g.). This can
> take a very long time for large volumes but makes attacks on the
> ciphered data harder.
>
> The Arch wiki has some discussion of this:
>
>    https://wiki.archlinux.org/index.php/Dm-crypt/Drive_preparation
>
> You also need to decide where you want the encrypted layer to sit:
> you can encrypt PVs (meaning that the entire volume group using
> those PVs is encrypted), or you can encrypt individual LVs.
>
> The choice depends on what you want to protect and how much of a
> performance penalty you are willing to take for the encryption.
>   
>> Of course they can.  Then you just loop mount the encrypted LUKS
>> device (physical disk or LV, or even a file) and then put a filesystem
>> on the new device.  Then you mount that filesystem and away you go.
superb, thanks chaps,
on keyfiles, would you know why this:

cryptsetup luksOpen /dev/h300Int1/0 h300Int1.0_crypt 
/etc/crypttab.key --keyfile-offset 12

won't work? Whenever I use offset, I will not get:
Key slot 0 unlocked.
Command successful.

thanks.

> No need for loop devices or mounts - a dm-crypt layer looks just
> like a regular linear device-mapper device and can be mounted or
> passed to tools like mkfs just like any other.
>
> The only extra things you have to deal with are the rather long
> UUID-based names that luks uses by default and the need to give
> the passphrase or key to unlock the device at boot or activation
> time - there are mechanisms integrated in most modern distros to
> assist with this either via configuration files or interactive
> prompts.
>
> Again, Arch have a pretty good overview in their wiki:
>
>    https://wiki.archlinux.org/index.php/Dm-crypt
>
> Regards,
> Bryn.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
