function prob = Histogram(new_point, hist_conts, hist_edges, delta)
  dims = length(delta);
  p_new_x = 1;
  for i=1:dims
    bin_idx = find(edges_tmp >= new_x, 1, 'first');
    if 1 <= bin_idx && bin_idx < length(hist_edges)
      count = hist_conts(bin_idx);
    else
        count = 0;
    end
    p_new_x = p_new_x * (count / total_count);
  end


  distns = maxis - minis;
  points = points-minis; % points are NxD
  loc = new_points ./ delta; % new points are MxD
  a = new_points - delta; % a has the lower bound MxD
  b = new_points + delta; % b has the upper bound MxD
  prob = zeros(size(new_points,1),1);
  for i=1:size(new_points,1)
    prob(i) = np.sum((points >= a) & (points <= b)) /
    points = points((points >= a) & (points <= b))
  end
  count = np.sum((points >= a) & (points <= b))
  cont = count(points)

  %n de x en i / N por delta

end
