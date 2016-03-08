References: <56DDBAF8.8040105@yahoo.co.uk>
	<22237.56958.981481.778563@quad.stoffel.home>
	<20160308111228.GA18072@hex.gsslab.fab.redhat.com>
	<56DEDB6D.2030502@yahoo.co.uk>
From: Ondrej Kozina <okozina@redhat.com>
Message-ID: <56DEDE57.5000701@redhat.com>
Date: Tue, 8 Mar 2016 15:14:47 +0100
MIME-Version: 1.0
In-Reply-To: <56DEDB6D.2030502@yahoo.co.uk>
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
Cc: peljasz@yahoo.co.uk

On 03/08/2016 03:02 PM, lejeczek wrote:
> superb, thanks chaps,
> on keyfiles, would you know why this:
>
> cryptsetup luksOpen /dev/h300Int1/0 h300Int1.0_crypt
> /etc/crypttab.key --keyfile-offset 12
>

IIUC it seems like missing -d/--key-file option in front of 
"/etc/crypttab.key" string. Well it also depends on actual content of 
your /etc/crypttab.key file. Does it really contain backup of your 
keyslot passphrase (human readable text data)? Or does it contain volume 
key for your luks device (usually looks like binary data, bunch of 
random bytes that really should not be human readable:))

Regards
Ondrej
