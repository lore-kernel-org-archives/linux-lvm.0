Message-ID: <3D820EB3.5060801@comedia.it>
From: Luca Berra <bluca@comedia.it>
MIME-Version: 1.0
Subject: Re: [linux-lvm] software mirroring
References: <2100.24.46.54.254.1031670341.squirrel@mail.scottsavarese.com>        <3D7E0CC0.D7B06D44@silicide.dk>        <2951.24.46.54.254.1031678903.squirrel@mail.scottsavarese.com>        <20020911080049.GA28187@gw.silicide.dk> <1596.24.46.54.254.1031862235.squirrel@mail.scottsavarese.com>
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
Date: Fri Sep 13 11:16:24 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Scott Savarese wrote:
> OK...I finally got it to work...However I couldn't put the / or /boot
> partitions under LVM control which would have been perfect... So I created
> a
> 4 Gb / partition which contains /boot as well, and set lilo to boot off of
> that. Everything else will be under LVM control...

which problems did you find in putting / (or /boot) on LVM over MD?
(btw i am running such a setup)

> Is there a howto out there on how to combine raid and lvm? Is there a need
not that i know of
> to write one?
probably yes
