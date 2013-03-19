Date: Tue, 19 Mar 2013 11:32:15 -0400
From: David Teigland <teigland@redhat.com>
Message-ID: <20130319153215.GB986@redhat.com>
References: <1363699970-10002-1-git-send-email-bubble@hoster-ok.com>
	<1363699970-10002-11-git-send-email-bubble@hoster-ok.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1363699970-10002-11-git-send-email-bubble@hoster-ok.com>
Subject: Re: [linux-lvm] [PATCH 10/10] man: document --node option to
	lvchange
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
To: Vladislav Bogdanov <bubble@hoster-ok.com>
Cc: linux-lvm@redhat.com

On Tue, Mar 19, 2013 at 01:32:50PM +0000, Vladislav Bogdanov wrote:
> +.B \-\-node \fINodeID
> +Perform specified activation command on a remote cluster node (the same to running
> +corresponding command on that node locally).
> +Currently tested only for corosync clusters (\fB-I\fP \fIcorosync\fP option to clvmd)
> +for corosync versions from 2.0.
> +If corosync configuration has node names in a nodelist (nodelist.node.X.name = name
> +in CMAP tems) or node names are used for ring0_addr (nodelist.node.X.ring0_addr = name),
> +then that names may be used as NodeID. Otherwise numeric node IDs should be used.

lvm tools should move away from doing remote command execution.
As you mentioned before, this is the equivalent of "ssh node lvchange".
ssh or some other tool outside lvm is the right way to run the remote
commands.

Also, lvm should not assume that it's using dlm/corosync, or that this
kind of remote option will be possible to support.
