Received: from lacrosse.corp.redhat.com (lacrosse.corp.redhat.com
	[172.16.52.154])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l8BHTm8v010205
	for <linux-lvm@redhat.com>; Tue, 11 Sep 2007 13:29:48 -0400
Received: from [10.11.15.65] (vpn-15-65.rdu.redhat.com [10.11.15.65])
	by lacrosse.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	l8BHTluO006853
	for <linux-lvm@redhat.com>; Tue, 11 Sep 2007 13:29:47 -0400
Subject: Re: [linux-lvm] Any exiisting users of existing LVM2 command line
	library interface (lvm2cmd.h)?
From: Dave Wysochanski <dwysocha@redhat.com>
In-Reply-To: <46E6A8DB.6040802@redhat.com>
References: <1189521146.4451.17.camel@linux-cxyg> <46E6A8DB.6040802@redhat.com>
Date: Tue, 11 Sep 2007 13:29:53 -0400
Message-Id: <1189531794.4451.27.camel@linux-cxyg>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 2007-09-11 at 10:40 -0400, James Parsons wrote:
> Dave Wysochanski wrote:
> 
> >A new LVM2 API library is in progress.
> >
> >If you are an existing user of the current command line library
> >interface or are interested in a new LVM2 library, we're interested to
> >hear input:
> >1) how you are currently using the existing interface
> >2) what you would like to see in the new interface
> >
> >Thanks. 
> >
> >_
> >
> I maintain the gnome graphical tool for lvm called system-config-lvm, as 
> well as a web based lvm configuration tool called conga. I depend on the 
> current command line set to make the app work. Will the rug soon be 
> pulled out from under me? :)
> 

Hi Jim!  ;-)
We're still a ways off.  We'll be sure to let you know.

It would be nice to get an idea of the lvm cmds you use and which
options.  Is it easy to grep through the code and find this or do you
have a list handy?

I know cluster info is here:
http://sourceware.org/cluster/
and upstream conga code is here correct?
cvs -d :pserver:cvs@sources.redhat.com:/cvs/cluster checkout conga

I could not readily locate the upstream code for system-config-lvm.


> No big deal, as long as I have a little warning - like a quarter, or so. 
> As you amend the CLI, though, please maintain the 'machine readable' 
> output commands...ones without column headers or unnecessary formatting 
> characters, so that my app, and the many, many users that have built 
> scripts around the CLI are not confronted with surprises.
> 
> Maintaining compatibility with the current CLI for a few releases of the 
> new CLI would be a nice gift to us!
> 
We will do our best to maintain backward compatibility, especially in
areas we know people are already using.

Thanks.
