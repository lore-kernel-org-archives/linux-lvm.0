Message-ID: <2F75AEE4E86FDE44BF97709D289BAA7C38E008@vega.voltaire.com>
From: Dan Bar Dov <danb@voltaire.com>
MIME-Version: 1.0
Subject: [linux-lvm] LVM in a cluster
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
Date: Sun Oct 26 12:06:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Is it possible to define PVs/VGs/LVs on one system, and then using lvscan
discover them all on another connected to the same storage?

Is it then possible to serve those LVs further to other computers, say via
NFS, and then what about coherency between the two LVM servers?

We are wotking on a storage gateway - iscsi from one side, FC on the other.
We are thinking on adding LVM functionality in there, but I have a feeling
it'll make HA impossible.

Dan  
