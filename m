Message-ID: <51AF3BD4.5070203@pse-consulting.de>
Date: Wed, 05 Jun 2013 15:23:32 +0200
From: Andreas Pflug <pgadmin@pse-consulting.de>
MIME-Version: 1.0
References: <1363699970-10002-1-git-send-email-bubble@hoster-ok.com>
	<20130319164224.GI20480@agk-dp.fab.redhat.com>
	<5148A372.6050402@hoster-ok.com>
In-Reply-To: <5148A372.6050402@hoster-ok.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] clvmd leaving kernel dlm uncontrolled lockspace
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, teigland@redhat.com

Hi David,

I got quite some trouble with clvmd on corosync 2.3.0/dlm; apparently a 
nonfunctional clvmd in the cluster can block all others (kern.log states 
clvmd stuck for >120s in some dlm call). I tried to clean things up 
killing -9 clvmd, but it will remain on state D or Z. Unfortunately, it 
seems that those zombies still keep some dlm stuff locked. When I 
restart corosync on a node and dlm_controld -D on it, I see "found 
uncontrolled lockspace, tell corosync to remove nodeid from cluster".

Well, that's fine for the first step, but how about cleaning up the dlm 
lockspace? dlm_tool leave <lockspace> hangs as well (sometimes it just 
fails with error 49). The comment in dlm_controld/action.c isn't too 
satisfactory: need reboot, not funny if a whole cluster is affected. I'd 
really appreciate a way to manually clean old lockspaces. I'd presume 
that an uncontrolled lockspace on an isolated node should be easily 
removable...


Regards
Andreas
