From: Andres Salomon <dilinger@mp3revolution.net>
Message-Id: <20020221091438.GB13013@mp3revolution.net>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] lvm2 debian packages
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
Date: Thu Feb 21 03:14:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I've built experimental lvm2 debian packages.  There are a few kinks to
work out, but they work for the most part (I'm using them now on a
server).

Add the following to your /etc/apt/sources.list:
deb http://incandescent.mp3revolution.net/lvm2 ./
deb-src http://incandescent.mp3revolution.net/lvm2 ./

Run the following:
apt-get update && apt-get install lvm2 kernel-patch-device-mapper;

Patch your linux-2.4.1[67] kernel w/
/usr/src/kernel-patches/all/device-mapper/linux-2.4.1[67]-devmapper-ioctl.patch.gz,
make config, enabled device mapper, compile and install.  If built as a
module, /etc/init.d/lvm2 start will modprobe it in.

Comments welcome.  I've also committed these to cvs HEAD, so feel free
to check out device-mapper/LVM2 and build yourself.

Additional packages include libdevmapper, libdevmapper-dev, and dmsetup.

-- 
"I think a lot of the basis of the open source movement comes from
  procrastinating students..."
	-- Andrew Tridgell <http://www.linux-mag.com/2001-07/tridgell_04.html>
