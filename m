Message-ID: <23233866A70C32479532C8D0B8AE7B96025D72F7@i2km07-ukbr.domain1.systemhost.net>
From: narsimha.kulkarni@bt.com
MIME-Version: 1.0
Subject: [linux-lvm] help on PV
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
Date: Fri Jun 13 05:37:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,

I had a 8GB disk on which the / was configured.

Then I added another 40GB disk which I configured under LVM.

Now I want to add the 8GB also as a logical disk to the volume group in
which the 40GB.

If I do a pvcreate on the 8GB, will I lose all the data on / or just
pvcreate and extend it.

Narsimha
