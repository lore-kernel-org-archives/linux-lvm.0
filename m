From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] software mirroring
Message-ID: <20020911064801.GB20315@percy.comedia.it>
References: <2005.24.46.54.254.1031578510.squirrel@mail.scottsavarese.com> <3D7CC062.2040108@comedia.it> <3338.24.46.54.254.1031594005.squirrel@mail.scottsavarese.com> <20020910103245.GB9619@percy.comedia.it> <1412.24.46.54.254.1031663551.squirrel@mail.scottsavarese.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1412.24.46.54.254.1031663551.squirrel@mail.scottsavarese.com>
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
Date: Wed Sep 11 01:48:41 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: Scott Savarese <scott@scottsavarese.com>

On Tue, Sep 10, 2002 at 09:12:31AM -0400, Scott Savarese wrote:
>> which would tell lilo to put its boot sector at the beginning of hdc1
>> and its mirrored copy.
>
>I made the change but the black magic isn't working...I am getting L 80
>80... again.
>
L 80 means that LILO loaded the boot sector, but a disk not ready error
prevented it from finding the second stage boot loader (/boot/boot.b)

looks like it is looking on the wrong drive...

are you 100% positive that you have replaced lilo with a standard dos
mbr on hdc?

another option is to use:
disk = /dev/hdc
  bios = 0x80

boot = /dev/hdc

in your lilo.conf, but this does not work seamlessly with raid
and you need two lilo.conf (one for hda and one for hdc)

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
