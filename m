From: Daniel Savard <dsavard@cids.ca>
Content-Transfer-Encoding: 7bit
Message-Id: <1014754031.10436.60.camel@dirac.cids.ca>
MIME-Version: 1.0
Subject: [linux-lvm] lvm 1.0.3, kernel 2.4.17 and the libs...
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
Date: Tue Feb 26 14:07:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I did a major mistake while playing with my LVs resulting in corruption
or my VG. So, I am trying to recover as much as I can from my system.
All my filesystems where LV except /, /boot and /usr. However, /var,
/tmp, /home and /opt were LVs which are no longer accessible.

I tried to run the vgcfgrestore command and I am running into the
following error:

vgcfgrestore: error while loading shared libraries: /lib/liblvm-10.so.1:
undefined symbol: opt_ignore

I built all the stuff in the lvm-build directory and installed it
accordingly to the instructions (make, make install).

Anybody can help me with this one?

-- 

=======================================
Daniel Savard

Internet: dsavard@cids.ca
=======================================
