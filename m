From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] LVM and mounting
Message-ID: <20021120132912.A21708@uk.sistina.com>
References: <3DDAA535.3030206@backflip.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3DDAA535.3030206@backflip.com>; from kgorman@backflip.com on Tue, Nov 19, 2002 at 12:55:17PM -0800
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
Date: Wed Nov 20 07:29:28 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Nov 19, 2002 at 12:55:17PM -0800, Kenny Gorman wrote:
> I would just like to remove the entire volume and group and start over 
You'll need to wipe the LVM label at the start of each PV.

LVM2 has a tool which will do this for you called pvremove: 
  e.g. if the PV to wipe is /dev/sdb4:  pvremove -ff /dev/sdb4
  (works for both old and new metadata formats)

Or you can just use "dd" - example for the old (LVM1) metadata format:
  dd if=/dev/zero of=/dev/sdb4 count=1

Alasdair
-- 
agk@uk.sistina.com
