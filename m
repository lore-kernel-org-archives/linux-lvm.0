Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p9ED7xug010953
	for <linux-lvm@redhat.com>; Fri, 14 Oct 2011 09:07:59 -0400
Received: from nm27.bullet.mail.sp2.yahoo.com (nm27.bullet.mail.sp2.yahoo.com
	[98.139.91.97])
	by mx1.redhat.com (8.14.4/8.14.4) with SMTP id p9ED7wZx018134
	for <linux-lvm@redhat.com>; Fri, 14 Oct 2011 09:07:58 -0400
References: <1318526936.84653.YahooMailNeo@web110412.mail.gq1.yahoo.com>
	<20111013132508.4d55780f@bettercgi.com>
Message-ID: <1318597677.52947.YahooMailNeo@web110409.mail.gq1.yahoo.com>
Date: Fri, 14 Oct 2011 06:07:57 -0700 (PDT)
From: Dusty Mabe <dustymabe@yahoo.com>
In-Reply-To: <20111013132508.4d55780f@bettercgi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] dynamic lvm snapshots (auto-resize)
Reply-To: Dusty Mabe <dustymabe@yahoo.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

Ray,�

Thanks so much for your answer. You said the feature is being "worked on". I see some work related to thin provisioning "pools" in the latest LVM code. Is this the work you are referring to? If so do you know anything about it (maybe just a paragraph about how it works)? This has peaked my interest and I look forward to what LVM has to offer in the future.

Have a good day!

Dusty�


----- Original Message -----
From: Ray Morris <support@bettercgi.com>
To: linux-lvm@redhat.com
Cc: Dusty Mabe <dustymabe@yahoo.com>
Sent: Thursday, October 13, 2011 2:25 PM
Subject: Re: [linux-lvm] dynamic lvm snapshots (auto-resize)

I think that's being worked on / beta. Until it's ready, we implemented
it in a daemon that is 49 lines of Perl. This particular implementation 
is set to match our environment but you can modify it to your needs:

#!/usr/bin/perl

use Getopt::Long;
use lib 'lib';
use Linux::LVM;

my $lvname;
my $usage = "usage: $0 --lvname lvname\n";
die $usage unless ( GetOptions ( "lvname=s" => \$lvname ) );
die $usage unless ($lvname);

my $ppid = getppid();
while ( -e "/proc/$ppid") {
� &check_snaps($lvname);
� sleep(60);
}

sub check_snaps {
� my $lvname = shift();
� for ($snapnum = 2; $snapnum >= 0; $snapnum--) {
� � if (-e "/dev/clones/${lvname}_snap${snapnum}") {
� � � my %lv = get_lv_info("/dev/clones/${lvname}_snap${snapnum}");
� � � next unless ($lv{'lv_name'});
� � � unless ($lv{'allocated_to_snapshot'}) {
� � � � � system('lvremove', '-f', "clones/${lvname}_snap${snapnum}");
� � � � � next;
� � � }
� � � if ($lv{'allocated_to_snapshot'} > 80) {
� � � � � print "live extending ${lvname}_snap${snapnum}\n";
� � � � � system('lvextend', '-f', '-l', '+20%LV', "clones/${lvname}_snap${snapnum}");
� � � }
� � }
� }
}
-- 
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php




On Thu, 13 Oct 2011 10:28:56 -0700 (PDT)
Dusty Mabe <dustymabe@yahoo.com> wrote:

> Hi Everyone,
> 
> I am interested to see if there is any support for automatically
> resizing an lvm snapshot when it becomes full or bypasses a certain
> utilization? There has been �at least some interest in this in the
> past as I have found the following post in the mailman archives.�
> 
> http://www.redhat.com/archives/linux-lvm/2007-November/msg00016.html
> 
> 
> Also it looks like HP as performed at least a similar implementation
> of this type of feature in their own product.�
> 
> http://bizsupport1.austin.hp.com/bc/docs/support/SupportManual/c02054539/c02054539.pdf
> 
> 
> 
> Thanks for any Help!!
> 
> Dusty Mabe
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
