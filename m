From: "Bharavi Oak" <Bharavi.Oak@patni.com>
Message-ID: <000101c2a035$27dd2370$c1bba5cc@patni.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Linux LVM: Device type for pseudo device
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
Date: Tue Dec 10 04:05:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,

I am writing a pseudo (filter) driver over SCSI disk driver (sd). There
would be corresponding pseudo devices created. These devices would in turn
access SCSI disk (thorugh sd) with some added functionality.
I want to use these pseudo device withe Linux LVM. But when I tried pvcreate
on such a device, the reponse was "invalid physical volume". Tracing the
source code showed that lvm_get_device_type does not recognize the pseudo
device as of a valid device type. In fact, valid device types have been
specified in a structure defined inside the function itself.
I used LVM version 1.0.3 as my platform is Red Hat Linux 7.x. Wanted to know
which LVM version recognizes such pseudo devices. Need some help to make my
pseudo driver work with LVM.

Thanks and Regards,
Bharavi Oak.
