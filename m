Message-ID: <000b01c2504a$f5db57f0$5701a8c0@bomoon>
From: "bo" <bo@sosnetwork.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Any way to remove a PV from LV for backup?
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
Date: Fri Aug 30 12:34:12 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

 Hello,

 The system has 4 PVs, which belongs to one VG and one LV.
 I want to remove a disk and replace it with new when the system
 consumes all of its space then start to use next PV.
 
 Q1: Is it really possible by LVM concept?
Q2: If I have one extra PV I could use "pvmove", but I do not have.
        Any way to resolve it?
Q3: Are there any way to replay each PV(backup PV) independently on 
       the seperate system?
 
 Any other idea or hint?
 
 Thanks,
 
 Bo
