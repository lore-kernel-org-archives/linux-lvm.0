Message-ID: <1596.24.46.54.254.1031862235.squirrel@mail.scottsavarese.com>
Subject: Re: [linux-lvm] software mirroring
From: "Scott Savarese" <scott@scottsavarese.com>
In-Reply-To: <20020911080049.GA28187@gw.silicide.dk>
References: <2100.24.46.54.254.1031670341.squirrel@mail.scottsavarese.com>
        <3D7E0CC0.D7B06D44@silicide.dk>
        <2951.24.46.54.254.1031678903.squirrel@mail.scottsavarese.com>
        <20020911080049.GA28187@gw.silicide.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Date: Fri Sep 13 08:30:32 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

OK...I finally got it to work...However I couldn't put the / or /boot
partitions under LVM control which would have been perfect... So I created
a
4 Gb / partition which contains /boot as well, and set lilo to boot off of
that. Everything else will be under LVM control...

I'll keep working on a way to do it with my old box :)...

Is there a howto out there on how to combine raid and lvm? Is there a need
to write one?

Thanks for everyone's help. It is much appreciated.

Scott
