From: Andreas Dilger <adilger@turbolabs.com>
Date: Thu, 27 Sep 2001 09:55:51 -0600
Subject: Re: [linux-lvm] vgscan 1.0.1-rc2 + kernel 2.4.10
Message-ID: <20010927095551.D19527@turbolinux.com>
References: <Pine.LNX.4.33.0109261252450.23800-100000@ct41987-a.jfrvil1.in.home.com> <01092615474801.01062@dpd16> <3BB2C142.20604@st-peter.stw.uni-erlangen.de> <01092712051501.01050@dpd16>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <01092712051501.01050@dpd16>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sep 27, 2001  12:05 -0300, Andre Margis wrote:
> I found the error, my /proc/partitions have thousands and thousands of lines!
> 
> maybe a kernel bug!

Yes, it is.  It has something to do with SCSI and modules.

Cheers, Andreas
--
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
