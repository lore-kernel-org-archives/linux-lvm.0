From: "Marco Pighi/Peru/Contr/IBM" <mpighi@pe.ibm.com>
Message-ID: <OFBB873518.294BA1D6-ON05256B0A.005AE0D8@pe.ibm.com>
MIME-Version: 1.0
Subject: [linux-lvm] LVM + 2.4.7 kernel
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
Date: Tue Nov 20 10:36:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi folks,

We have upgraded the kernel from a SuSE 7.0 (2.2.16 kernel) to a 2.4.7
kernel in our Linux for S/390 system. We upgraded modutils, binutils, gcc
and installed s390 tools as well. Almost everything is working well; the
only problem we have is lvm: it loads without problems at boot time but
when we try the vgscan command we get the following message:

     invalid i/o protocol version

Does anyone have any idea what could be wrong?

Thanks in advance.

Regards,

Marco.
