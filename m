Message-ID: <3DB2E206.1AA56845@silicide.dk>
From: Jon Bendtsen <jon+lvm@silicide.dk>
MIME-Version: 1.0
Subject: Re: [linux-lvm] creating a LVM ontop of a cryptated (ppdd) loop back 
 device
References: <3DAEDEE5.4540B954@silicide.dk> <20021017211217.GB4861@localhost> <3DAFB713.A2E7FAB3@silicide.dk> <20021018213759.GA4471@localhost> <3DB266FF.94DA814C@silicide.dk> <20021020153212.GA2950@localhost> <3DB2D26E.498738EC@silicide.dk> <20021020164309.GA6596@localhost>
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Sun Oct 20 12:04:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Jose Luis Domingo Lopez wrote:
> 
> On Sunday, 20 October 2002, at 17:57:34 +0200,
> Jon Bendtsen wrote:


> Then maybe we are talking about different things here. I used an
> encrypted filesystem over an unencrypted LV but, as loop-aes needs the
> loop device to operate, I need to loop-mount the encrypted filesystem for
> the system to be able to on-the-fly decrypt its contents.
> 
> Maybe I am confused, because I don't fully understand what you mean by
> "running LVM ontop of a encrypted loopback device".

We are talking different things.
I'll sum up what i did with 2 lines

losetup -e AES256 /dev/loop0 /dev/sdb1
pvcreate /dev/loop0




JonB
