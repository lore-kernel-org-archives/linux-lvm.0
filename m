From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] Painless upgrade to lvm2?
Message-ID: <20021203201107.B1339@uk.sistina.com>
References: <1038231397.21369.23.camel@defiant.sonsofthunder.yi.org> <02bb01c29b04$31556650$6a01a8c0@bmoon>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <02bb01c29b04$31556650$6a01a8c0@bmoon>; from bo@anthologysolutions.com on Tue, Dec 03, 2002 at 11:43:02AM -0800
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
Date: Tue Dec  3 14:11:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Dec 03, 2002 at 11:43:02AM -0800, bmoon wrote:
> /usr/bin/ld:.export.sym:1: parse error in VERSION script
Try changing the first line in lib/.export.sym
from '{' to 'Base {'  or alternatively update gcc &
binutils etc.

Alasdair
-- 
agk@uk.sistina.com
