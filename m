Message-ID: <BAY106-F4A807320203919FFE13A3F4350@phx.gbl>
In-Reply-To: <1113495234.25261.28.camel@grma-lap>
From: "Bahadir Kiziltan" <b_kiziltan@hotmail.com>
Date: Thu, 14 Apr 2005 17:20:45 +0000
Mime-Version: 1.0
Subject: [linux-lvm] RE: How to mirror or Replicate a primary server's data
	to asecondarymachine
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gary.Mansell@ricardo.com, nahant-list@redhat.com, linux-lvm@redhat.com, taroon-list@redhat.com, linux-poweredge@dell.com


I assume you mean a real-time replication solution. Also supports 
IP-failover so you don't worry about manual intervention.

- Constant Data (www.constantdata.com)
- PeerFS (www.radiantdata.com)

Both are the commercial products configured easily and can be downloaded for 
testing.


>From: "Gary Mansell" <Gary.Mansell@ricardo.com>
>Reply-To: Gary.Mansell@ricardo.com
>To: <nahant-list@redhat.com>, <linux-lvm@redhat.com>, 
><taroon-list@redhat.com>,        <linux-poweredge@dell.com>
>Subject: How to mirror or Replicate a primary server's data to 
>asecondarymachine
>Date: Thu, 14 Apr 2005 17:13:54 +0100
>
>Hi,
>
>I am considering whether to go down the path of a dual server, manual
>failover solution for one of my RHEL fileservers.
>
>I would have two identical servers in two different machine rooms on our
>site and if the main server failed then I would manually reconfigure the
>secondary server with the primary server's IP address so that the client
>machines can carry on working.
>
>Can anyone recommend to me what I need to do to mirror the data across
>the two servers so that updates to the primary server are also made to
>the secondary server
>
>Thanks in advance for any help
>
>Regards
>
>Gary Mansell
>--
>
>This e-mail and any files transmitted with it are confidential and intended
>solely for the use of the individual or entity to whom they are addressed.
>If you have received this e-mail in error please notify the sender 
>immediately
>and delete this e-mail from your system.  Please note that any views or 
>opinions
>presented in this e-mail are solely those of the author and do not 
>necessarily
>represent those of Ricardo (save for reports and other documentation 
>formally
>approved and signed for release to the intended recipient).  Only Directors
>or Duly Authorised Officers are authorised to enter into legally binding
>obligations on behalf of Ricardo unless the obligation is contained within
>a Ricardo Purchase Order.
>
>Ricardo may monitor outgoing and incoming e-mails and other 
>telecommunications
>on its e-mail and telecommunications systems.  By replying to this e-mail 
>you
>give consent to such monitoring.  The recipient should check this e-mail 
>and
>any attachments for the presence of viruses.  Ricardo accepts no liability 
>for
>any damage caused by any virus transmitted by this e-mail.  "Ricardo" means
>Ricardo plc and its subsidiary companies.
>
>Ricardo plc is a public limited company registered in England with 
>registered
>number 00222915.
>The registered office of Ricardo plc is Bridge Works, Shoreham-by Sea,
>West Sussex, BN43 5FG.
>
>
>_______________________________________________
>Linux-PowerEdge mailing list
>Linux-PowerEdge@dell.com
>http://lists.us.dell.com/mailman/listinfo/linux-poweredge
>Please read the FAQ at http://lists.us.dell.com/faq
