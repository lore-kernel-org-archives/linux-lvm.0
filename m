From: Monty Taylor <mordred@inaugust.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1040273929.24435.8.camel@blackbird>
Mime-Version: 1.0
Subject: [linux-lvm] PV Resizing
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
Date: Wed Dec 18 22:57:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hello.

I've managed to get myself into a rather funny spot -- I use LVM to
provide administrative flexibility, but I didn't account for one
possibility. I'm hoping someone has an idea...

I have a machine with a single hard drive. I have three partitions,
boot, swap, and the lvm partition. I now need to install a windows
partition... (damn CAD program won't run under WINE) Is there _any_ way
to resize the PV from under LVM? (Like with parted or something) so I
can create another partition? 

Thanks in advance.
Monty
