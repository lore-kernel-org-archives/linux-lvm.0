From: Nils Juergens <nils@muon.de>
Subject: Re: [linux-lvm] Segmentation Fault with vgextend and LVM 1.0.1rc4
Message-ID: <20011030101059.A1138@guldukat.muon.local>
References: <3BDE0947.7090203@gadreau.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3BDE0947.7090203@gadreau.net>
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
Date: Tue Oct 30 03:09:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, 29.10.01, Jean-Noel GADREAU <cathjn@gadreau.net> wrote:

[snip]
> vgextend -- extending volume group "vg01" by physical volume "/dev/hde1" 
> in kernel
> Segmentation fault (core dumped)
> 
> I am using RedHat 7.1 with a custom kernel to have LVM (2.4.9-6). I have 
> 2 drives on this IDE controller (a Promise UltraDMA100DX2) and both work 
> fine with linux. My secondary drive (/dev/hdf is already part of vg01).
[snip]

The stock linux kernel comes with an old version of lvm. Please grab
the latest version and make sure to patch your kernel (see
PATCHES/README in the lvm distribution). You should also upgrade your
userspace tools (lvcreate, vgextend and the like).

On a further note, check which compiler you are using. gcc-2.96 should
be used without optimization (-O0) and make sure you do not use
gcc-3.0.x (it produces broken code on some occasions, this happened to
me with the lvm tools).

good luck,

Nils

-- 
 >   Nils Juergens  | nils@muon.de | icq 7090774   <
 >  If we all work hard, we can turn this company  <
 >      around 360 degrees -- gruntbert(LOTD)      <
