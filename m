Subject: Re: [linux-lvm] Re: How to handle Bad Block relocation with LVM?
Message-ID: <20030214172615.GA2438@fib011235813.fsnet.co.uk>
References: <1045065586.477.16.camel@dev-ehopper.tiecommerce.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1045065586.477.16.camel@dev-ehopper.tiecommerce.com>
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
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
Date: Fri Feb 14 11:27:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Eric,

We would like to automate the process that you have described in LVM2
at some point.  So if you get an error on an LV and new PE will be
allocated, as much data as possible copied from the bad PE to the new
PE, and then remap the LV so that it's using the new PE (very much
like a small pvmove).

The EVMS team are writing a bad block relocator target for device
mapper, but I don't feel it's neccessary to add yet another device
layer to the LVs.  If I have a bad block I don't mind loosing a whole
PE (people may not agree with me on this ?)

- Joe
