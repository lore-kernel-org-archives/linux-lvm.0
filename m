Message-ID: <3BCB0216.66DC0628@storix.com>
Date: Mon, 15 Oct 2001 08:34:46 -0700
From: Anthony Johnson <anthony@storix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvcreate: no such device or address
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Sorry to repeat, but I've had no response and am dead in the water. Anyone 
had a similar problem or have advice on how to reolve this?

# lvcreate -d -l1 -n testlv1 uservg
...
<1> lv_create_node -- LEAVING with ret: 0
<1> lvm_error -- CALLED with: 6
<1> lvm_error -- LEAVING with: "No such device or address"
lvcreate -- ERROR "No such device or address" opening "/dev/uservg/testlv1"

After running this command, the node /dev/uservg/testlv1 was created in the 
directory but vgdisplay -v still shows there are no LVs in uservg. Tried 
this on different VGs, using different PE sizes, lvnames, etc with same results.
