From: Donald Thompson <dlt@dataventures.com>
Message-ID: <Pine.LNX.4.31.0111170421330.29772-100000@dv1.dataventures.com>
MIME-Version: 1.0
Subject: [linux-lvm] parameter error
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
Date: Sat Nov 17 05:31:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I'm getting the following error when I attempt to active a VG:

vgchange -- ERROR "parameter error" setting up snapshot copy on write
exception table for "/dev/IDE/temp_snap"

I'm using kernel 2.4.14, with lvm 1.0.1-rc4. Kernel has been patched using
the patch build with lvm 1.0.1-rc4. Its been so long since the VG was
built, I'm not sure what utils I originally made it with, but i'm
suspecting 0.9.1 beta 7.

I'm not exactly sure how I got myself into this mess, but I had just
finished removing another VG.

I've seen this come up a couple times on the mailing list in the past, but
but I haven't seen any positive fixes offered up. Could care less if the
snapshot thats causing the problems is lost. vgcfgrestore using a backup
config file didn't help me any.

Is there any way to get myself out of this without killing the VG?

-Don
