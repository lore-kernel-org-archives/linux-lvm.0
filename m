Message-ID: <401A66A2.2020309@skyraven.pcnet.ro>
From: Mihai Tanasescu <Mihai.Tanasescu@skyraven.pcnet.ro>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM data recovery
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
Date: Fri Jan 30 09:25:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Hello,

I've read the how-to at tldp.org but still can't figure out how to 
recover the data  I have on a LVM setup like this:

/dev/hda + /dev/hdb

/dev/hda has crashed....
I need to recover all data that is on /dev/hdb but vgscan and vgchange 
-ay volume_group_name don't seem to work if /dev/hda is gone

Can anyone help ?
What should I do ?
