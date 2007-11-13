Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lADKRaSZ031723
	for <linux-lvm@redhat.com>; Tue, 13 Nov 2007 15:27:36 -0500
Received: from server.klug.on.ca (server.klug.on.ca [205.189.48.131])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lADKROEX016292
	for <linux-lvm@redhat.com>; Tue, 13 Nov 2007 15:27:24 -0500
Received: from linux.interlinx.bc.ca (d38-139-100.home1.cgocable.net
	[72.38.139.100])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by server.klug.on.ca (Postfix) with ESMTP id 8A8192806
	for <linux-lvm@redhat.com>; Tue, 13 Nov 2007 15:27:23 -0500 (EST)
Received: from [10.75.22.1] (pc.ilinx [10.75.22.1])
	by linux.interlinx.bc.ca (Postfix) with ESMTP id 90579867B
	for <linux-lvm@redhat.com>; Tue, 13 Nov 2007 15:27:21 -0500 (EST)
Subject: Re: [linux-lvm] balooning/dynamic snapshots?
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
In-Reply-To: <4739DB30.9060805@wpkg.org>
References: <4739DB30.9060805@wpkg.org>
Date: Tue, 13 Nov 2007 15:27:21 -0500
Message-Id: <1194985641.24880.11.camel@pc.ilinx>
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

On Tue, 2007-11-13 at 18:13 +0100, Tomasz Chmielewski wrote:
> 
> Is it possible to make a "balooning", or dynamic LVM snapshot? That is, 
> if the snapshot reaches its maximum, it will be automatically resized, 
> provided we still have space on the medium.

Yeah, that is something I wanted at one time.  In it's absence, I hacked
up the following brute-force solution.  I don't like the concept, but it
works.

        #!/usr/bin/ruby
        
        threshold=80.0
        increase_factor=0.5
        
        IO.popen("/testsuite/ltest-boulder/acceptance/common/timed_run 10 /usr/sbin/lvs") do |f|
          f.each_line do |line|
            j,volume,j,j,size,j,used = line.chomp.split(/\s+/)
            if used.to_f > threshold then
              # by bytes
              #size = eval(size.sub(/G$/, ' * 1024 * 1024 * 1024'))
              re = /([\d\.]+)([GM])/
              md = re.match(size)
              size = md[1]
              units = md[2]
              expand_by = size.to_f * increase_factor
              system("echo \"lv #{volume} was #{size}#{units} big and #{used} full and was expaned +#{expand_by}#{units}\" | mail -s \"snap expanded\" root")
              system("/testsuite/ltest-boulder/acceptance/common/timed_run 60 /usr/sbin/lvextend -L+#{expand_by}#{units} /dev/vg0/#{volume}")
            end
          end
        end

Put it in cron and run at an appropriate frequency.

b.
