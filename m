From: Petro <petro@corp.vendio.com>
Message-ID: <20030614002027.GA26078@corp.vendio.com>
References: <3560BA143F45D5118E670000E82459214C2084@ssk.schneiderkenzingen.de> <20030612235501.GA15452@www.13thfloor.at>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030612235501.GA15452@www.13thfloor.at>
Subject: Re: [linux-lvm] snapshots+highmem+'md raid5'
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
Date: Fri Jun 13 19:21:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Jun 13, 2003 at 01:55:01AM +0200, Herbert Poetzl wrote:
> On Thu, Jun 12, 2003 at 03:28:59PM +0200, Koch, Steffen wrote:
> > If someone has a solution for this please help.
> hmm, do you have himem enabled (in kernel config)?
> if yes, try to disable it ...

    Does this apply to RAID 0 as well? 

    I've got several boxes running with:

    CONFIG_HIGHMEM4G=y
    # CONFIG_HIGHMEM64G is not set
    CONFIG_HIGHMEM=y

    And 2-4 GiB of ram under 2.4.18, with LVM 1.03. 

    I'm trying to get LVM 1.07 to compile with 2.4.21 with :
    
    CONFIG_HIGHMEM4G=y
    # CONFIG_HIGHMEM64G is not set
    CONFIG_HIGHMEM=y
    CONFIG_HIGHIO=y


    Why is this bad? 
    

-- 
"On two occasions, I have been asked [by members of Parliament], 'Pray, 
Mr. Babbage, if you put into the machine wrong figures, will the right 
answers come out?' I am not able to rightly apprehend the kind of confusion 
of ideas that could provoke such a question." -- Charles Babbage 
