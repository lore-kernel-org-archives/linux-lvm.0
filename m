From: Hee So <h.so@ieee.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20020801014624.5F3855F22C@dell103.hee.net>
Subject: [linux-lvm] Growing the size of the lv
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
Date: Wed Jul 31 20:42:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,

  I read and tried to no avail. I need some assistance. The
documentation is a little vague on this point. I am trying to 
grow a LV (which originally had two PVs, and adding a third PV). 
I run through the vgextend and did one other thing to eventually 
have my lvdisplay recognize the diskspace of all 3 PVs. Originally
the VG recognized all the 3 PVs, but the LV Size was the original.
After some twittling around, the LV Size was that of all 3 PVs.
when I run df -kh, I still get the size of the original diskspace
while I had two PVs and can't use this new diskspace.

I pvcreated the third PV.  I tried mounting and unmounting. 

Any help is appreciated,
/hee
h.so@ieee.org
