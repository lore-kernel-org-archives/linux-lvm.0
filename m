From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] LVM2 in a cluster and lvchange.
Message-ID: <20030918135129.K2155@uk.sistina.com>
References: <Sea2-F56SMXQebfaxI10000b3bf@hotmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Sea2-F56SMXQebfaxI10000b3bf@hotmail.com>; from benew666@hotmail.com on Thu, Sep 18, 2003 at 09:38:46AM +0900
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
Date: Thu Sep 18 07:52:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Sep 18, 2003 at 09:38:46AM +0900, tester7 A. wrote:
> My question is that 'doing lvchange -an /dev/vg10/test ; lvchage -ay 
> /dev/vg10/test' in the other node make the kernel recognize the lv changes. 
> Is there any better way or command, becase making inactive temporaryly does 
> not make me feel right.
 
Your other option is to poke around with dmsetup.

Currently:

  dmsetup suspend vg10-test
  lvchange -ay vg10/test

should work, but mixing dmsetup with the LVM2 tools
like that is not supported and so it could break as
a side-effect of changes in future releases.
 
Alasdair
-- 
agk@uk.sistina.com
