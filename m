From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] trying to restore data after Harddisk breakdown
Message-ID: <20030428213812.C19439@uk.sistina.com>
References: <3EABA9DC.2050507@stella.at> <20030427152621.A13215@uk.sistina.com> <3EAD8E6A.5020608@stella.at>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3EAD8E6A.5020608@stella.at>; from kai@stella.at on Mon, Apr 28, 2003 at 10:26:18PM +0200
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
Date: Mon Apr 28 15:38:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Apr 28, 2003 at 10:26:18PM +0200, Kai Iskratsch wrote:
> Cannot change metadata for partial volume group Data
> Restore failed
> how can I restore the metadata to the new disk?

There was some info about this on the list before IIRC:
If you're editing a text backup file intending to restore
from it, you need to make sure it's completely how you want
it first - check the VG has status READ and WRITE and not 
PARTIAL.

Alasdair
-- 
agk@uk.sistina.com
