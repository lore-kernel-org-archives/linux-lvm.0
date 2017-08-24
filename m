Date: Thu, 24 Aug 2017 10:19:14 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20170824151914.GA21493@redhat.com>
References: <CALSgSusawY1CK0LtaCfX8jY34Q1td=3EpcAVRByvVoV19rwuNw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALSgSusawY1CK0LtaCfX8jY34Q1td=3EpcAVRByvVoV19rwuNw@mail.gmail.com>
Subject: Re: [linux-lvm] How to compile lvm with lvmlockd
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
To: Ravi Hemnani <raviiihemnani@gmail.com>
Cc: linux-lvm@redhat.com

On Tue, Aug 22, 2017 at 10:29:25PM +0530, Ravi Hemnani wrote:
> Hey
> 
> How to compile lvm with lvmlockd? I cant see any documentation related to
> that. I want to use lvmlockd on ubuntu/debian. Any help is appreciated.

You'll need packages for dlm and sanlock, and configure lvm with
--enable-lvmlockd-sanlock --enable-lvmlockd-dlm.

Dave
