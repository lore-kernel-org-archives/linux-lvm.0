From: Benoit <benoit.peccatte@enst-bretagne.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200311111144.36636.benoit.peccatte@enst-bretagne.fr>
Subject: [linux-lvm] lvm metadata
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
Date: Tue Nov 11 07:58:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hello,

I'm wondering why lvm metadata isn't stored directly into physical volumes. It 
would then be possible to read it without having acces to any filesystem. 
You may ask why. Then is my second question, why aren't vgscan and vgchange 
implemented in kernel and called at boot time ? This would make us be able to 
consider logical volumes as standard partitions and mount them easily, even 
as /

Thank you,
Benoit.

PS: Please cc-me with the anser as I'm not subscribed to the list.
