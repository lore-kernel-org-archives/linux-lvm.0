From: Alexander Lazarevich <alazarev@hera.itg.uiuc.edu>
Message-ID: <Pine.A41.4.43.0208231621580.45552-100000@hera.itg.uiuc.edu>
MIME-Version: 1.0
Subject: [linux-lvm] RAID 1 recontruct
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
Date: Fri Aug 23 16:26:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux LVM Sistina <linux-lvm@sistina.com>

This is a little off topic but I can't find an answer elsewhere and I'm
hoping you guys can help me out.

I've got redhat 7.3 with LVM, the system drive is software RAID 1, which I
set up during install. One of the drives failed, and the system went to
degraded mode. Fine, but I replaced the failed drive, and I thought the
software RAID would auto-reconstruct, but it isn't. It's still running in
degraded mode.

How do I tell the system about the new drive and reconstruct the RAID 1
array? The replacement drive is a known good drive.

Thanks in advance,

Alex
---                                                        ---
   Alex Lazarevich | Systems | Imaging Technology Group
   alazarev@itg.uiuc.edu | (217)244-1565 | www.itg.uiuc.edu
---                                                        ---
