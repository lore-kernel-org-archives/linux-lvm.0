From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] pvcreate problem on new IDE disk
Message-ID: <20030421000714.A30038@uk.sistina.com>
References: <20030419192108.A18402@ultraviolet.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030419192108.A18402@ultraviolet.org>; from treed@ultraviolet.org on Sat, Apr 19, 2003 at 07:21:08PM -0700
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
Date: Sun Apr 20 18:07:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, Apr 19, 2003 at 07:21:08PM -0700, Tracy R Reed wrote:
>   /dev/hdd2: Couldn't find device.

Two things to check first:
  Make sure that /dev/hdd2 exists and that other programs can
write/read it;
  Run 'vgscan' and then try the pvcreate again.
[vgscan needs running after new devices are added] 

Alasdair
-- 
agk@uk.sistina.com
