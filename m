From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Differences between LVM1 and LVM2
Message-ID: <20021121120126.C8329@sistina.com>
References: <3DDA963B.7080309@crepido.com>
Mime-Version: 1.0
In-Reply-To: <3DDA963B.7080309@crepido.com>; from tomas.roos@crepido.com on Tue, Nov 19, 2002 at 08:51:23PM +0100
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
Date: Thu Nov 21 05:08:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Nov 19, 2002 at 08:51:23PM +0100, Tomas Roos wrote:
> Hi.
> 
> I have been using LVM for about a year now at a number of machines. One 
> I have had in production for about 4 months I think. I have never had 
> any problems with this piece of software .. very stable.
> 
> I would like to know what to think about when upgrading to LVM release 2

LVM2 is metadata and command line compatible to LVM1 plus it adds some nice
features such as a configuration file with various sections for device name
filtering and more.
You have the choice with it to upgrade your metadata to a more redundant format2
which causes updates to the metadata to be transaction oriented therefore
enhancing the online recoverablilty of the LVM system.

We still declare LVM2 to be in Beta _because_ it misses the soon to be added
feature to online relocate data (pvmove).

It is stable and you should give it a try :)

> 
> Best regards
> /Tomas
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
