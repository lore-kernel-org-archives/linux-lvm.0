Message-ID: <20011211183257.23795.qmail@web9506.mail.yahoo.com>
From: SI Reasoning <sczjd@yahoo.com>
In-Reply-To: <20011211115418.B27568@sistina.com>
MIME-Version: 1.0
Subject: [linux-lvm] problem resizing without losing data
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
Date: Tue Dec 11 12:31:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I am using Mandrake cooker and lvm-0.9-3mdk. I
recently created lvm group Mandrake with volume 1 =
/usr, vol 2 = var and vol 3 = home. vol 1 and 2 are
xfs and 3 is reiserfs. I recently attempted to shrink
var by 500 meg and then expand usr by  500 meg. This
hosed my system as many files in var were lost
(although there was plenty of room to spare on var). 
Also, even though lvscan showed my changes had taken
place, the rest of the system still only recognized
prior values.

Is there a way to do non-destructive resizing with lvm?

=====
SI Reasoning
sczjd@yahoo.com

"They that can give up essential liberty to obtain a little temporary safety deserve neither liberty nor safety." 
Benjamin Franklin

__________________________________________________
Do You Yahoo!?
Check out Yahoo! Shopping and Yahoo! Auctions for all of
your unique holiday gifts! Buy at http://shopping.yahoo.com
or bid at http://auctions.yahoo.com
