Date: Tue, 18 Mar 2014 04:04:02 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20140318040402.GE12820@agk-dp.fab.redhat.com>
References: <531ECA9E.6080602@oracle.com>
	<20140312155830.GA15638@agk-dp.fab.redhat.com>
	<532255C5.2050203@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <532255C5.2050203@oracle.com>
Subject: Re: [linux-lvm] Segmentation fault in LVM2 latest version.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: xiaowei <xiaowei.hu@oracle.com>
Cc: zkabelac@redhat.com, Joe Jin <joe.jin@oracle.com>, linux-lvm@redhat.com

On Fri, Mar 14, 2014 at 09:05:09AM +0800, xiaowei wrote:
> That's great you reproduced this bug:)

> So the fix could be easy?

No.  Once you know what's wrong, you can find several more classes
of lvextend that misbehave.

I do have a prototype fix that deals with the case you hit, but it's not
complete yet.

There are two ways you can extend an LV: 
  1. By pairing up newly-allocated areas of disk with existing ones 
     as you go along.
     (A simple example would be extending each existing stripe on the same
     disk.)
  2. By finding possible areas of disk to fit the required
     number of areas then selecting the most appropriate ones.
     (The general case.)
You can also have a combination of the two, with some areas from 1
and some from 2.

The first is 'PREFERRED' in the code, and the second is 'USE_AREA'.
The path through the code that you hit tried to use the first
method when it should have used the second.
(If the number of stripes is changing there's no trivial way to 
'pair up' the new areas with the existing ones.)
Minor structural changes are needed (code clean up) so that the
cling policy can sometimes use the second method.
The default 'allocation/maximise_cling' option fails.

Alasdair
